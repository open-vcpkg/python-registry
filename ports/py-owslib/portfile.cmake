vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME        OWSLib
    VERSION         ${VERSION}
    SHA512          e71a553b4cbba7b5d650e495a376bab8e27ce99dcb0ada26997b29d6deae1ac6d1de5ac30d980f2b12c494af1179e6c14ed8eae606efc820a17e8f2d94786b78
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "owslib")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
