vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    tzdata
    VERSION         ${VERSION}
    SHA512          88a1cc19f111be08abb2cf7aebf1d74f50b1ff0e4fac039bb01d9d64c125b7542e297b583c7c87acb267843949a7e20fa1801d6757fd1914046c2a49b2874ab1
)
vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "tzdata")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)