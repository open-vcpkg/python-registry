vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    fonttools
    VERSION         ${VERSION}
    SHA512          dae67d4c69ccb6408af11d265bd4d7012f35f8cc299b50fa1c15a01f3a50c9cb78a15fb158e5106e3c1d3a2f08c19b33a4833d006e318d9ff53796afde373075
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${CURRENT_PORT_DIR}/copyright")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
