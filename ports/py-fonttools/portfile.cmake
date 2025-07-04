vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    fonttools
    VERSION         ${VERSION}
    SHA512          5ffd02b01b8f9d3c5ec9697b8ef6dc950abf7f111b21a9b4e9563d7aa99fc00b9d96d62650385bb4d253b86854728c163b654ace1309b0ba2fe8dd6d20bcc1eb
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${CURRENT_PORT_DIR}/copyright")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
