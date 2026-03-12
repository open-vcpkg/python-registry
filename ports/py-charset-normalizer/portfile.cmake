set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    charset-normalizer
    VERSION         ${VERSION}
    SHA512          4d58d983a948644d89a25f5563171447c8fadcc252a9a3471d4b5e5ffeff94ddd56bce6a5c3fa84744a15b37b14145f645cef9b1635ef2bfe470abe5e259f55b
    FILENAME        charset_normalizer
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "charset_normalizer")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
