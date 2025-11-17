set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pyproj
    VERSION         ${VERSION}
    SHA512          aeaf944f80a520c9417ad6acf8d74e217024c366d9ce6462a16ab8f72908c5cb4f4aa6a088deb97467a8eb5f2f33d41e454a16ced2b1c483d1e6ee354799d910
    FILENAME        pyproj
)

# Read PROJ version from SPDX metadata
set(PROJ_SPDX "${CURRENT_INSTALLED_DIR}/share/proj/vcpkg.spdx.json")
if(NOT EXISTS "${PROJ_SPDX}")
    message(FATAL_ERROR "Could not find ${PROJ_SPDX} – is proj installed?")
endif()

file(READ "${PROJ_SPDX}" PROJ_SPDX_JSON)

# Extract: "versionInfo": "9.5.0"
string(REGEX MATCH "\"versionInfo\"[ \t\r\n]*:[ \t\r\n]*\"([^\"]+)\"" _ "${PROJ_SPDX_JSON}")
set(PROJ_VERSION "${CMAKE_MATCH_1}")

if(NOT PROJ_VERSION)
    message(FATAL_ERROR "Failed to extract PROJ version from ${PROJ_SPDX}")
endif()

message(STATUS "Detected PROJ version: ${PROJ_VERSION}")

set(ENV{PROJ_VERSION} "${PROJ_VERSION}")
set(ENV{PROJ_DIR} "${CURRENT_INSTALLED_DIR}")

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}" ENVIRONMENT ${build_env})

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "pyproj")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
