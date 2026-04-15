set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
set(VCPKG_POLICY_MISMATCHED_NUMBER_OF_BINARIES enabled)
set(VCPKG_BUILD_TYPE release) # No debug builds required for pure python modules since vcpkg does not install a debug python executable. 

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    scipy
    VERSION         ${VERSION}
    SHA512          c2930d9be072057eb25394d6bee7fbe504f1b7c442b5393641ab3ff6bba590d4a76d240eb3a2ef58891bcb449af847de056a8957c591caa8fbf496ce9ce5a9e5
    PATCHES
      "no-fortran.patch"
      "interpolate.patch"
)

vcpkg_replace_string("${SOURCE_PATH}/meson.build" "py3.dependency()" "dependency('python-3.${PYTHON3_VERSION_MINOR}', method : 'pkg-config')")

vcpkg_install_python_build_dependencies(
    PACKAGES "pythran" "gast" "beniget" "ply"
)

vcpkg_mesonpy_prepare_build_options(OUTPUT meson_opts)

z_vcpkg_setup_pkgconfig_path(CONFIG "RELEASE")

list(APPEND meson_opts
  "--python.platlibdir" 
  "${CURRENT_INSTALLED_DIR}/${PYTHON3_SITE}"
)

# needed so pythran can be found
vcpkg_add_to_path("${CURRENT_HOST_INSTALLED_DIR}/bin")


if (VCPKG_TARGET_IS_OSX)
  list(APPEND meson_opts
    "-Dblas=accelerate"
    "-Dlapack=accelerate"
  )
else()
  list(APPEND meson_opts
    "-Dblas=blas"
    "-Dlapack=lapack"
  )
endif()

if (VCPKG_TARGET_IS_WINDOWS)
  list(APPEND meson_opts
    "-Duse-pythran=false"
  )
endif()

list(JOIN meson_opts "\",\""  meson_opts)

vcpkg_python_build_and_install_wheel(
  SOURCE_PATH "${SOURCE_PATH}"
  OPTIONS 
    --config-json "{\"setup-args\" : [\"${meson_opts}\" ] }"
)

set(subdir "${CURRENT_PACKAGES_DIR}/${PYTHON3_SITE}/")
set(pyfile "${subdir}/scipy/__config__.py")
file(READ "${pyfile}" contents)
if (VCPKG_TARGET_IS_WINDOWS)
  string(REPLACE "/" "\\" python_executable ${VCPKG_PYTHON3})
else()
  set(python_executable ${VCPKG_PYTHON3})
endif()
string(REPLACE "from enum import Enum" "from enum import Enum\nimport sys" contents "${contents}")
string(REPLACE "r\"${python_executable}\"" "sys.executable" contents "${contents}")
string(REPLACE "${CURRENT_INSTALLED_DIR}" "$(prefix)" contents "${contents}")
string(REGEX REPLACE "\"commands\": +r\"[A-Za-z0-9_ .:\\/-]+[/\\]([A-Za-z0-9_-]+)${VCPKG_HOST_EXECUTABLE_SUFFIX}\"" "\"commands\": r\"\\1${VCPKG_HOST_EXECUTABLE_SUFFIX}\"" contents "${contents}")
file(WRITE "${pyfile}" "${contents}")

file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/debug/include"
    "${CURRENT_PACKAGES_DIR}/debug/share"
)

file(GLOB licenses "${SOURCE_PATH}/LICENSE*")
vcpkg_install_copyright(FILE_LIST ${licenses})

vcpkg_python_test_import(MODULE "scipy")

# Add required Metadata for some python build plugins
file(WRITE "${CURRENT_PACKAGES_DIR}/${PYTHON3_SITE}/scipy-${VERSION}.dist-info/METADATA"
"Metadata-Version: 2.1\n\
Name: scipy\n\
Version: ${VERSION}"
)

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
