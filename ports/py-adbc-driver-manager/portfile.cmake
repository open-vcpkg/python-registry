vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    adbc-driver-manager
    VERSION         ${VERSION}
    SHA512          e3a8d578ac9bf157323d6b3004d8c182ad331fc2c19b74ecf3b9c4a8a1da17aceb368d787c6128c4d3de31728882bb7bea3914202736f7f937cf837a92b446e2
    FILENAME        adbc_driver_manager
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "adbc_driver_manager")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)