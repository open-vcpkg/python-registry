vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    fonttools
    VERSION         ${VERSION}
    SHA512          d13c6ed76444f849b4202caa4e38ff1b50ffb470d2767562e43c6ef98eb418fa9467326abe1c4721144e1668af0ed0e4ad33af92c0938d799e6224c5a1afbab9
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${CURRENT_PORT_DIR}/copyright")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
