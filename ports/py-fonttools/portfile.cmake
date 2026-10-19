vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    fonttools
    VERSION         ${VERSION}
    SHA512          cdd8b89f3b10008116fbc58a96fa30bf29f13be8a6eeebd6f263afefb3a992ac3571158b0ecbf193be70c3b8a6433e78a975657ace7c72a68fc44569dee9536f
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${CURRENT_PORT_DIR}/copyright")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
