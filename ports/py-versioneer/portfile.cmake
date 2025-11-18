set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    versioneer
    VERSION         ${VERSION}
    SHA512          7fcab2e196f7f5872f64482a5de4fecf65b5d8c4b84174cccaac0e951b8eb5f20a4253fa61b89b5d7ea2857205b8a72d925efa92574119741b0f331bf8da8877
    FILENAME        versioneer
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "versioneer")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
