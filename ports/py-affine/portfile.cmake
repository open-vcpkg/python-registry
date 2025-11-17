set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    affine
    VERSION         ${VERSION}
    SHA512          e09c78338c650ce592590ec17a6ce22732a5d1b52c52410c1a25b5ad9e319bffd679c588b1eb3159ac215013f5f228d03470926ad6778d3f85e089d26ce76752
    FILENAME        affine
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

vcpkg_python_test_import(MODULE "affine")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
