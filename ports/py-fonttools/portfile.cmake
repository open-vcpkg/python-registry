vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    fonttools
    VERSION         ${VERSION}
    SHA512          f933085ce4f413009400041e22840dcfb534550318ed14943787b9a92ce0301eeaee7b229d83feeff17971bd2d0ed229d32a93b22be1b9faa2f4bbefa983f5dc
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${CURRENT_PORT_DIR}/copyright")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
