set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    charset-normalizer
    VERSION         ${VERSION}
    SHA512          2891c0bd3097ad38d296a8378ded36110a06113c0f79e49cdfd7f3bca4f42487d10895db34cbb020cb70e93d9094ae72555ceef5535f8984de1cac4082232f4f
    FILENAME        charset_normalizer
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "charset_normalizer")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
