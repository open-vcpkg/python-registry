vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    owslib
    VERSION         ${VERSION}
    SHA512          801514c9cc903591e8800798631266d0522b26686971f9c855b6e9400ece23f9642fb05d22e1689a96f9f9cefc9d4eac730a4ed1682266d73ece47dcc771aa04
    FILENAME        owslib
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "owslib")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
