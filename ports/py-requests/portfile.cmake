set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    requests
    VERSION         ${VERSION}
    SHA512          20d413597ff4803a62156ada25ef2e8a5edd0d4dbf7d79cc7fcd88d51a76e019a7dacf41d7c3d546306f37c506ede68f16b9afea57c918db64e702382b1ae420
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "requests")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
