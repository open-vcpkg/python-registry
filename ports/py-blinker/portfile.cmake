vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    blinker
    VERSION         ${VERSION}
    SHA512          587eaead4750eb742209703d792498293579dc55afc855498066b49a067527b6b3eccbe9a35ddbacc2cb1b7ced0bb3bb7a5716dba82d87b434a6ca8281bd76e5
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "blinker")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
