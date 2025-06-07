vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    fonttools
    VERSION         ${VERSION}
    SHA512          d860a4ce9e7dd9d3f58cfc7458a9e96d2ad017c163382d69b28cc680328578fe598b301dfc375c7e6023f11a6880690211e33eafb696091e80bfeef829aeaaf2
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${CURRENT_PORT_DIR}/copyright")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
