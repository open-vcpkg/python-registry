vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    contourpy
    VERSION         ${VERSION}
    SHA512          3a9462c22535fe1729c1ac845b7d5a799f78c1eadad092d962d833f835d0f53453a501bf56040b57f783863620ead63fe9bb7b4f23a282510fbe367f87546634
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${CURRENT_PORT_DIR}/copyright")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
