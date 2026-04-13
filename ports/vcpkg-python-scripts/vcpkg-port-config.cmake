include_guard(GLOBAL)

include("${CMAKE_CURRENT_LIST_DIR}/../python3/vcpkg-port-config.cmake")

set(PYTHON3_BASEDIR "${CURRENT_INSTALLED_DIR}/tools/python3")
find_program(PYTHON3 NAMES python${PYTHON3_VERSION_MAJOR}.${PYTHON3_VERSION_MINOR} python${PYTHON3_VERSION_MAJOR} python PATHS "${PYTHON3_BASEDIR}" NO_DEFAULT_PATH)
set(PYTHON3_SITEPACKAGES "${CURRENT_PACKAGES_DIR}/${PYTHON3_SITE}")
set(PYTHON3_BUILD_VENV "${CURRENT_HOST_INSTALLED_DIR}/tools/build_venv")
vcpkg_add_to_path(PREPEND "${PYTHON3_BUILD_VENV}/bin")
if(VCPKG_TARGET_IS_WINDOWS)
  vcpkg_add_to_path(PREPEND "${PYTHON3_BUILD_VENV}/Scripts")
endif()
set(ENV{PKG_CONFIG_PATH} "${CURRENT_HOST_INSTALLED_DIR}/share/pkgconfig:$ENV{PKG_CONFIG_PATH}")

include("${CMAKE_CURRENT_LIST_DIR}/vcpkg_python_functions.cmake")
