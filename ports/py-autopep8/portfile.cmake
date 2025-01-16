vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    autopep8
    VERSION         ${VERSION}
    SHA512          1fc897feec093e7e945b10bbd3cbbef5a83c4ec7d86215fb9643434d80a14ff54bf613dbb9dd0acacc9706ac35e8f0486ef643ae49da040471965d41fdd03cc4
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "autopep8")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
