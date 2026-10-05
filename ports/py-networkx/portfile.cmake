set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    networkx
    VERSION         ${VERSION}
    SHA512          a5f3d6b7bc5a41a2996443fcb0b86ca5da9a7c80b29866aa308c2145a574caa95522073db28029e6ba11c8eb1b20e59ddefec460f472d548bdd4ec9ecea36090
    FILENAME        networkx
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

vcpkg_python_test_import(MODULE "networkx")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
