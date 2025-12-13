set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    networkx
    VERSION         ${VERSION}
    SHA512          d3ccbdf15b93facf71c8f0f508b85204f77273af1180e885a2bde79631237f7f08a4521a88a52b599b179df94e2b58916cc2ee21be20d893a8d6a0f86d9a3a30
    FILENAME        networkx
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

vcpkg_python_test_import(MODULE "networkx")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
