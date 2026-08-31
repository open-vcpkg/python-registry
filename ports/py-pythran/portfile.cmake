vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pythran
    VERSION         ${VERSION}
    SHA512          638dc09bbd8f424cb91b36270d529369108a44b28ac16418012e83e66f426f33ad1057ddf9fcacc90567dfad7b03f37279fd0d42beaf63131413108506c99016
)
vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "pythran")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)