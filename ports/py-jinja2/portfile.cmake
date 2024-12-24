vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    Jinja2
    VERSION         ${VERSION}
    SHA512          75ad0094482c69d45fcd3aa8ee32e249931e53fee3f804f6ddfd5b6da0ed16962d8f1fced811e7dcb4d8401fadd828e77528d6d1280547a7d4f5f77cccf9bbd4
    FILENAME        jinja2
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
