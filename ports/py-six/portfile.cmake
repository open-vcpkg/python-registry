vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO benjaminp/six
    REF ${VERSION}
    SHA512 50fe7cddac79d03cff390475a4d36118a8ec1b3c4709a434edc6e71edc009afca8f89065b44df1756e78fedcb415e29a460179fe171013dcd38a69aba5ff0e2a
    HEAD_REF master
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_python_test_import(MODULE "six")
