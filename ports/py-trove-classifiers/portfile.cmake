set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    trove_classifiers
    VERSION         ${VERSION}
    SHA512          4fc6efc514638dfb2aee4fbd06f258bb9d5d9d54269e6d33f3739a63d61d6d3caa9a7124f9e5ad601714253c27b97bc9a60f3a9369f2f358ed19fbdfcefcbb10
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "trove_classifiers")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
