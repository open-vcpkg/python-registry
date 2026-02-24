vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    joblib
    VERSION         ${VERSION}
    SHA512          221fe426aa4c90d75080b63bf6bb0b9c61e4ae90bd2a734d2b658013e9a00125bc14574d475789b4d8d246a1a5b5c6f67754e639080de6ecb9a481d1d124c0ed
    FILENAME        joblib
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "joblib")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)