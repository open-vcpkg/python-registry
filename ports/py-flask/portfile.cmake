vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    flask
    VERSION         ${VERSION}
    SHA512          977c0e5fd2d496fae8e34a035f211118642dc6518a14dc5f6c175b72c6a76407aeb9ff0ed1f5db636370a9aa7e0d36baa783713ea7bdabd7f28c8c2b94643cd1
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "flask")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
