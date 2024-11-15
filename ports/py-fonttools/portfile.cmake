vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    fonttools
    VERSION         ${VERSION}
    SHA512          6eeb68b5ca200338a8bea7a46141cc69a6a13441260a2a4a00d6a540a1ce37ea6e5502f7bf3a3774aad24df21d13b88c20ed8e634317b94526dee724d76ef7da
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${CURRENT_PORT_DIR}/copyright")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
