vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    click
    VERSION         ${VERSION}
    SHA512          c60395f07622103e5d0592a5a212665bde0b7de88d9bf47a3e11750eb0e3fa52cde5ff57830ed3c1617ffbfc2f91adae64d4e9dc268ab1a3ce09155650f7c063
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "click")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
