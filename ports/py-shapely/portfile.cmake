set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    shapely
    VERSION         ${VERSION}
    SHA512          91fe2dd602121cf216f22c899e1557edcb53b9e32681d40b15bbe6d32d342625d6e6ef7b3a5d21fd606cab851b094e6ca87b6ec699f478fefe851eb7b3c8afb6
    FILENAME        shapely
)

set(ENV{GEOS_INCLUDE_PATH} "${CURRENT_INSTALLED_DIR}/include")
set(ENV{GEOS_LIBRARY_PATH} "${CURRENT_INSTALLED_DIR}/lib")

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

vcpkg_python_test_import(MODULE "shapely")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
