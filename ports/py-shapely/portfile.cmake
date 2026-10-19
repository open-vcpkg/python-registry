set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    shapely
    VERSION         ${VERSION}
    SHA512          d227333086b5495c0188da178da7c256055260f54b45aff158c5addd3957406e88a5607dea816ee5afd7f466b97f0ab2043c1454f4df214d7c64a770966fa9d6
    FILENAME        shapely
)

set(ENV{GEOS_INCLUDE_PATH} "${CURRENT_INSTALLED_DIR}/include")
set(ENV{GEOS_LIBRARY_PATH} "${CURRENT_INSTALLED_DIR}/lib")

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

vcpkg_python_test_import(MODULE "shapely")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
