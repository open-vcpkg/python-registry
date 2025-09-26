vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    fonttools
    VERSION         ${VERSION}
    SHA512          5eaf9f113d73f74ba3a7d4229601cb3510a7fc896ed912fbafc82f8b28bc5e719bea92d7f4f9c561b2dda8a08c28088b4a2e309095266f42fd9af65895174e62
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${CURRENT_PORT_DIR}/copyright")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
