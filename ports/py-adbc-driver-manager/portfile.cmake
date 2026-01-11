vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    adbc-driver-manager
    VERSION         ${VERSION}
    SHA512          7d6b54efdc9a4b75212276e0ce0c434270f4da1042212e690231c5ee2e2f1fc81081d42c070e3ab9de73805de42f2180205643553903b346711d8885b223daf7
    FILENAME        adbc_driver_manager
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "adbc_driver_manager")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)