set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    trove-classifiers
    VERSION         ${VERSION}
    SHA512          06210009c52e6d4bb070f40052a396a48d9643b09864d2ac370449a91200818aabb595703048b3cb1fb97551e8e86d17b4cccbc3dbc19b34d199bdcbe50c3d96
    FILENAME        trove_classifiers
    FILENAME        trove_classifiers
    FILENAME        trove_classifiers
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "trove_classifiers")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
