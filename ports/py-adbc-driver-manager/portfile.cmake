vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    adbc-driver-manager
    VERSION         ${VERSION}
    SHA512          3d4eea24d83e51da49c043d9e7713124ee98ececf15950f89ca2cfde562255e0787bdbc85a00bab1dda3b6d9a5583218f8d1ca92fbad132cb5cf7a2b44988b2a
    FILENAME        adbc_driver_manager
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "adbc_driver_manager")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)