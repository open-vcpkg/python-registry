set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    attrs
    VERSION         ${VERSION}
    SHA512          945ea1766adf7e8c8cc8b8f8c63c3dca652553522cede6a09d479f9919a41d43539819da2fe6fdc0e0b42822e353c7cb04b79fb9cecfd54bde5e301574a82341
    FILENAME        attrs
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "attr")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
