vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME        fonttools
    VERSION         ${VERSION}
    SHA512          7a0224b0cc493b0535ab328d3e741f4ad932ee0af314c729f26b6b6be2ac7e1d3958f287c0408fb0e6e481ef4bc78b01d0a069388fd1ea4f9d7eb92726e55482
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${CURRENT_PORT_DIR}/copyright")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
