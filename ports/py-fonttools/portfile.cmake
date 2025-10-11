vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    fonttools
    VERSION         ${VERSION}
    SHA512          6782b9afe0fd6152716c6c8dfeed0f6328a1e38286fa47fb5e37807cc1385d13b887e397f8b478dace9cd3bf7cb700c45682982d6313079571ca0a0b1ffdbc70
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${CURRENT_PORT_DIR}/copyright")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
