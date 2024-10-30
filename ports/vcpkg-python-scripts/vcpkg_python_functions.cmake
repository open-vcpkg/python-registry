set(ENV{SETUPTOOLS_SCM_PRETEND_VERSION} "${VERSION}")
set(ENV{PDM_BUILD_SCM_VERSION} "${VERSION}")

function(vcpkg_from_pythonhosted)
  cmake_parse_arguments(
    PARSE_ARGV 0
    "arg"
    ""
    "OUT_SOURCE_PATH;PACKAGE_NAME;VERSION;SHA512;FILENAME"
    "PATCHES")

  if(DEFINED arg_UNPARSED_ARGUMENTS)
    message(WARNING "vcpkg_from_pythonhosted was passed extra arguments: ${arg_UNPARSED_ARGUMENTS}")
  endif()

  if(NOT DEFINED arg_OUT_SOURCE_PATH)
      message(FATAL_ERROR "OUT_SOURCE_PATH must be specified.")
  endif()
  if(NOT DEFINED arg_PACKAGE_NAME)
    message(FATAL_ERROR "PACKAGE_NAME must be specified.")
  endif()
  if(NOT DEFINED arg_VERSION)
    message(FATAL_ERROR "VERSION must be specified.")
  endif()
  if(NOT DEFINED arg_FILENAME)
    set(arg_FILENAME "${arg_PACKAGE_NAME}")
  endif()
  
  string(SUBSTRING "${arg_PACKAGE_NAME}" 0 1 _PACKAGE_PREFIX)
  vcpkg_download_distfile(ARCHIVE
    URLS "https://files.pythonhosted.org/packages/source/${_PACKAGE_PREFIX}/${arg_PACKAGE_NAME}/${arg_FILENAME}-${arg_VERSION}.tar.gz"
    FILENAME "${arg_PACKAGE_NAME}-${arg_VERSION}.tar.gz"
    SHA512 ${arg_SHA512}
  )

  vcpkg_extract_source_archive_ex(
    OUT_SOURCE_PATH SOURCE_PATH
    ARCHIVE ${ARCHIVE}
    PATCHES ${arg_PATCHES}
  )

  set("${arg_OUT_SOURCE_PATH}" "${SOURCE_PATH}" PARENT_SCOPE)
endfunction()

function(vcpkg_python_build_wheel)
  cmake_parse_arguments(
    PARSE_ARGV 0
    "arg"
    ""
    "SOURCE_PATH;OUTPUT_WHEEL"
    "OPTIONS;ENVIRONMENT"
  )

  # These are common variables used by python backends
  set(ENV{SETUPTOOLS_SCM_PRETEND_VERSION} "${VERSION}")
  set(ENV{PDM_BUILD_SCM_VERSION} "${VERSION}")

  set(build_ops "${arg_OPTIONS}")

  set(z_vcpkg_wheeldir "${CURRENT_PACKAGES_DIR}/wheels")

  file(MAKE_DIRECTORY "${z_vcpkg_wheeldir}")

  message(STATUS "Building python wheel!")

   list(JOIN arg_ENVIRONMENT " " env)
  if(CMAKE_HOST_WIN32)
    set(env "")
    set(env_backup_vars "")
    foreach(envvarline IN LISTS arg_ENVIRONMENT)
      if(envvarline MATCHES "([^=]+)=(.+)")
        list(APPEND env_backup_vars "${CMAKE_MATCH_1}")
        if(DEFINED ENV{${CMAKE_MATCH_1}})
          set(env_bak_${CMAKE_MATCH_1} "$ENV{${CMAKE_MATCH_1}}")
        endif()
        set(ENV{${CMAKE_MATCH_1}} "${CMAKE_MATCH_2}")
      else()
        message(FATAL_ERROR "'${envvarline}' is not a valid line for setting an environment variable!")
      endif()
    endforeach()
  endif()

  vcpkg_cmake_get_vars(cmake_vars_file)
  include("${cmake_vars_file}")

  set(ENV{CFLAGS} "${VCPKG_COMBINED_C_FLAGS_RELEASE}")
  set(ENV{CXXFLAGS} "${VCPKG_COMBINED_CXX_FLAGS_RELEASE}")
  set(ENV{LDFLAGS} "${VCPKG_COMBINED_SHARED_LINKER_FLAGS_RELEASE}")
  set(ENV{ARFLAGS} "${VCPKG_COMBINED_STATIC_LINKER_FLAGS_RELEASE}")

  vcpkg_execute_required_process(
    COMMAND ${env} "${PYTHON3}" -m gpep517 build-wheel --wheel-dir "${z_vcpkg_wheeldir}" --output-fd 1 ${build_ops}
    LOGNAME "python-build-${TARGET_TRIPLET}"
    WORKING_DIRECTORY "${arg_SOURCE_PATH}"
  )

  foreach(env_var IN LISTS env_backup_vars)
    if(DEFINED env_bak_${env_var})
      set(ENV{${env_var}} "${env_bak_${env_var}}")
    else()
      unset(ENV{${env_var}})
    endif()
  endforeach()

  message(STATUS "Finished building python wheel!")

  file(GLOB WHEEL "${z_vcpkg_wheeldir}/*.whl")

  set(${arg_OUTPUT_WHEEL} "${WHEEL}" PARENT_SCOPE)
endfunction()

function(vcpkg_python_install_wheel)
  cmake_parse_arguments(
    PARSE_ARGV 0
    "arg"
    ""
    "WHEEL"
    ""
  )

  set(build_ops "")

  set(install_prefix "${CURRENT_INSTALLED_DIR}")
  if(VCPKG_TARGET_IS_WINDOWS)
    string(APPEND install_prefix "/tools/python3")
  endif()

  message(STATUS "Installing python wheel:'${arg_WHEEL}'")
  vcpkg_execute_required_process(COMMAND "${PYTHON3}" -m installer 
    --prefix "${install_prefix}" 
    --destdir "${CURRENT_PACKAGES_DIR}" "${arg_WHEEL}"
    LOGNAME "python-installer-${TARGET_TRIPLET}"
    WORKING_DIRECTORY "${CURRENT_BUILDTREES_DIR}"
  )
  message(STATUS "Finished installing python wheel!")

  cmake_path(GET CURRENT_INSTALLED_DIR ROOT_NAME rootName)
  cmake_path(GET CURRENT_INSTALLED_DIR ROOT_DIRECTORY rootDir)
  cmake_path(GET CURRENT_INSTALLED_DIR STEM fullStem)
  string(REPLACE "${rootName}/" "/" without_drive_letter_installed ${CURRENT_INSTALLED_DIR})

  string(REPLACE "/" ";" path_list "${without_drive_letter_installed}")
  list(GET path_list 1 path_to_delete)

  if(NOT EXISTS "${CURRENT_PACKAGES_DIR}/tools" AND EXISTS "${CURRENT_PACKAGES_DIR}${without_drive_letter_installed}/tools")
    file(RENAME "${CURRENT_PACKAGES_DIR}${without_drive_letter_installed}/tools" "${CURRENT_PACKAGES_DIR}/tools")
  else()
    file(COPY "${CURRENT_PACKAGES_DIR}${without_drive_letter_installed}/" DESTINATION "${CURRENT_PACKAGES_DIR}/")
  endif()
  file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/${path_to_delete}")
endfunction()

function(vcpkg_python_build_and_install_wheel)
  cmake_parse_arguments(
    PARSE_ARGV 0
    "arg"
    ""
    "SOURCE_PATH"
    "OPTIONS;ENVIRONMENT"
  )
  vcpkg_python_build_wheel(
    OUTPUT_WHEEL wheel
    ENVIRONMENT ${arg_ENVIORNMENT}
    SOURCE_PATH "${arg_SOURCE_PATH}"
    OPTIONS ${arg_OPTIONS}
  )
  vcpkg_python_install_wheel(
    WHEEL "${wheel}"
  )
endfunction()

function(vcpkg_python_test_import)
  cmake_parse_arguments(
    PARSE_ARGV 0
    "arg"
    ""
    "MODULE"
    ""
  )

  message(STATUS "Testing package!")

  set(RELATIVE_SITE_PACKAGES_DIR "${PYTHON3_SITEPACKAGES}")
  cmake_path(RELATIVE_PATH RELATIVE_SITE_PACKAGES_DIR BASE_DIRECTORY "${CURRENT_INSTALLED_DIR}")

  set(INSTALLED_DLL_DIR "${CURRENT_INSTALLED_DIR}/bin")
  set(PACKAGE_DLL_DIR "${CURRENT_PACKAGES_DIR}/bin")
  set(PACKAGE_SITE_PACKAGES_DIR "${CURRENT_PACKAGES_DIR}/${RELATIVE_SITE_PACKAGES_DIR}")
  configure_file("${CURRENT_HOST_INSTALLED_DIR}/share/vcpkg-python-scripts/import_test.py.in" "${CURRENT_BUILDTREES_DIR}/import_test.py" @ONLY)

  vcpkg_execute_required_process(COMMAND "${PYTHON3}" "${CURRENT_BUILDTREES_DIR}/import_test.py"
    LOGNAME "python-test-import-${TARGET_TRIPLET}"
    WORKING_DIRECTORY "${CURRENT_BUILDTREES_DIR}"
  )
  message(STATUS "Finished testing package!")
endfunction()
