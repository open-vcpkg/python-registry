set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    requests
    VERSION         ${VERSION}
    SHA512          8308da5ec2b1bd4442497dc8ecb21d4c1d3aba82987a264bc0f55b75d2522b303e5779f704d1b557a0f7d8a8f0a3533925cc34a58d98a95ce463a0dd59c5ac2d
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "requests")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
