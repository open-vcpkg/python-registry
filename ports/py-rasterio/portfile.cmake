set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    rasterio
    VERSION         ${VERSION}
    SHA512          ce20ca32ea3e4a887dd2fc18ccae4abe774d3754bc560b8a85228d9df58a829e12a04c2dcca2aadbcf888afd6dd89fe5a66cb0ec8231c9d996002ca47742e053
    FILENAME        rasterio
)
# Read GDAL version from SPDX metadata
set(GDAL_SPDX "${CURRENT_INSTALLED_DIR}/share/gdal/vcpkg.spdx.json")
if(NOT EXISTS "${GDAL_SPDX}")
    message(FATAL_ERROR "Could not find ${GDAL_SPDX} – is gdal installed?")
endif()

file(READ "${GDAL_SPDX}" GDAL_SPDX_JSON)

# Extract: "versionInfo": "3.12.0"
string(REGEX MATCH "\"versionInfo\"[ \t\r\n]*:[ \t\r\n]*\"([^\"]+)\"" _ "${GDAL_SPDX_JSON}")
set(GDAL_VERSION "${CMAKE_MATCH_1}")

if(NOT GDAL_VERSION)
    message(FATAL_ERROR "Failed to extract GDAL version from ${GDAL_SPDX}")
endif()

message(STATUS "Detected GDAL version: ${GDAL_VERSION}")

set(ENV{GDAL_VERSION} "${GDAL_VERSION}")

file(WRITE "${SOURCE_PATH}/setup.cfg" "
[build_ext]
include_dirs=${CURRENT_INSTALLED_DIR}/include
library_dirs=${CURRENT_INSTALLED_DIR}/lib
libraries=gdal
")

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

vcpkg_python_test_import(MODULE "rasterio")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
