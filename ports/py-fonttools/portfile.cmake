vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    fonttools
    VERSION         ${VERSION}
    SHA512          e2bde6283aa2c88b0cef56557d1ef7cebbdf14abfdbde2a1cea6b4aba79a6d920c8eef2844d57b4d9db0b2647fa130f5f08cae62a71be9c9cbc2c95e6e52c081
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${CURRENT_PORT_DIR}/copyright")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
