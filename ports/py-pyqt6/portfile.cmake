set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    PyQt6
    VERSION         ${VERSION}
    SHA512          c2ff8c47c9b0e43c009d0c90f565a54344e6f384c67dd30c2d422465d0702c07713acc0095c8b67827d1146675611c07d548ba282a26e41bb60a0a21977a7a64
)

if(CMAKE_HOST_WIN32)
    set(EXE_SUFFIX ".exe")
endif()

set(SIPBUILD_ARGS
  "--confirm-license"
  "--qmake" "${CURRENT_INSTALLED_DIR}/tools/Qt6/bin/qmake${EXE_SUFFIX}"
  "--api-dir" "${CURRENT_PACKAGES_DIR}/share/qt6/qsci/api/python"
  "--verbose"
  "--qt-shared"
  "--no-make"
  "--disable" "QtDesigner"
  "--pep484-pyi"
  "--target-dir" "${CURRENT_PACKAGES_DIR}/lib/python${PYTHON3_VERSION_MAJOR}.${PYTHON3_VERSION_MINOR}/site-packages"
  "--build-dir" "${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-rel"
)

message(STATUS "Running sipbuild...")

vcpkg_backup_env_variables(VARS PATH)

# Make sure sipbuild can find QtCore.dll
vcpkg_add_to_path(PREPEND "${CURRENT_INSTALLED_DIR}/tools/Qt6/bin/" "${CURRENT_INSTALLED_DIR}/bin")

vcpkg_execute_required_process(
    COMMAND "${PYTHON3}" "-m" "sipbuild.tools.build" ${SIPBUILD_ARGS}
    WORKING_DIRECTORY "${SOURCE_PATH}"
    LOGNAME "sipbuild-${TARGET_TRIPLET}"
)
message(STATUS "Running sipbuild...finished.")

if(CMAKE_HOST_WIN32)
    if(VCPKG_TARGET_IS_MINGW)
        find_program(MINGW32_MAKE mingw32-make REQUIRED)
        set(invoke_command "${MINGW32_MAKE}")
    else()
        vcpkg_find_acquire_program(JOM)
        set(invoke_command "${JOM}")
    endif()
else()
    find_program(MAKE make)
    set(invoke_command "${MAKE}")
endif()

message(STATUS "Running build...")
vcpkg_execute_build_process(
    COMMAND "${invoke_command}" -j ${VCPKG_CONCURRENCY} install
    NO_PARALLEL_COMMAND "${invoke_command}" -j 1 install
    WORKING_DIRECTORY "${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-rel"
    LOGNAME "build-${TARGET_TRIPLET}-rel"
)
message(STATUS "Running build...finished.")

vcpkg_python_test_import(MODULE PyQt6)

vcpkg_restore_env_variables(VARS PATH)