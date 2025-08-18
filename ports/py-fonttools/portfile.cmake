vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    fonttools
    VERSION         ${VERSION}
    SHA512          98c4534841424759a32f2c6c0e5394ab85f19a4ccdaaed9e3f5b3ba4bcddde61f607fba3e8ec9b9d6ecb1c1aeb77e0c3f1b276b861ce2fd2f4513669e76bf799
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${CURRENT_PORT_DIR}/copyright")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
