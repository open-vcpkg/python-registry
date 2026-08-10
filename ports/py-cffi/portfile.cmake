set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    cffi
    VERSION         ${VERSION}
    SHA512          60299646ae72e54155a3ca220f00a2b2fee079276a01ff13e30fb6af0d19b07fb4ae539af55e4704ce2081d34c4a3079ef43c0dcb2fe854f835f8441b348f7c5
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "cffi")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
