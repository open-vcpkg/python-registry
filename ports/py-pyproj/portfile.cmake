set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pyproj
    VERSION         ${VERSION}
    SHA512          118ca30bb22e0aaaa3f24642385f1692ec6df713349d9956cbce9d5875d80c0c113d9dc3f13edb940ce7d35d9bc3d3afbafe8e06d54a6811e93aa77c19f0c3a7
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
