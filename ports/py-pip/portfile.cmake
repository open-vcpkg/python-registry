vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME        pip
    VERSION         ${VERSION}
    SHA512          2fad7072473d67fa0dbfc2c060b1b4752ea1b0d021051ebef44a668e6c9c731a530b1afb38872fdbc2efec0598fae532e61a5ed545524875b51a3fe0a8d11d96
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
