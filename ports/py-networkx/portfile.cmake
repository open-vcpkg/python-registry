set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    networkx
    VERSION         ${VERSION}
    SHA512          9c060385913cfe67126e71eb9e53c032faa51c9609336ce78333d22e5f73078eb5b4826e0709cae0bd448fef2a5b2fb6f4c29be28c70d34a936d1cf6a00e83a1
    FILENAME        networkx
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

vcpkg_python_test_import(MODULE "networkx")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
