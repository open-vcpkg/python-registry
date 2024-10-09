set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    urllib3
    VERSION         ${VERSION}
    SHA512          f461cc959d675b8b13c2f40f4b021cab01ccb3a5033143f5c3eae3fce7486115994d198c78db9ef353fce47c17b25e0ecb010fbdebc1b8731d4fd708054b39cc
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

vcpkg_python_test_import(MODULE "urllib3")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
