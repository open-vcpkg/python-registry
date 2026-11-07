include_guard(GLOBAL)

include("${CMAKE_CURRENT_LIST_DIR}/../python3/vcpkg-port-config.cmake")

set(PYTHON3_BASEDIR "${CURRENT_INSTALLED_DIR}/tools/python3")
find_program(PYTHON3 NAMES python${PYTHON3_VERSION_MAJOR}.${PYTHON3_VERSION_MINOR} python${PYTHON3_VERSION_MAJOR} python PATHS "${PYTHON3_BASEDIR}" NO_DEFAULT_PATH)
set(PYTHON3_SITEPACKAGES "${CURRENT_PACKAGES_DIR}/${PYTHON3_SITE}")

if(VCPKG_CROSSCOMPILING AND NOT CURRENT_HOST_INSTALLED_DIR STREQUAL CURRENT_INSTALLED_DIR)
    # The build tools (gpep517, installer, setuptools, wheel, ...) are host dependencies, but PYTHON3 is the
    # target interpreter. They are pure Python, so let the target interpreter import them from the host tree.
    # Only works if the target interpreter can run on the build machine (e.g. x64 under Rosetta).
    vcpkg_host_path_list(APPEND ENV{PYTHONPATH} "${CURRENT_HOST_INSTALLED_DIR}/${PYTHON3_SITE}")
endif()

include("${CMAKE_CURRENT_LIST_DIR}/vcpkg_python_functions.cmake")
