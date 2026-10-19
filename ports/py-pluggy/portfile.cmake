set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pluggy
    VERSION         ${VERSION}
    SHA512          945b352d9a5562764830ac7b7199d8801f4486638bf0b1630f61d7a102b466119af2c1e168cb457bcedf1212be1c5ebcb0848f05c76e91db34951f43c48ae466
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "pluggy")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
