vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    fonttools
    VERSION         ${VERSION}
    SHA512          26d81455394f38c3e97a6f354a85ee409d91e8fec7e196d56d4ca9edd863cd2e43ca20e6bbd85c03e00eb21570e14336fc90a6a0ed41ec8c3926761a98dd56a4
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${CURRENT_PORT_DIR}/copyright")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
