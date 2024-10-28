vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    blinker
    VERSION         ${VERSION}
    SHA512          037822e014974aaa9d6faf76805b09c06d697de9555cf4cd1265e639c52f72c5ed905e4698140b49a5e011806d91541636a7cf58082aabdd927c60dffd7df012
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "blinker")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
