set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    idna
    VERSION         ${VERSION}
    SHA512          5cdfa086a6a1d2c5fbb6fe56ceae5434a71e2215711d252be41f82cebfa48cef35cc8b2ff03e6af17ae309f230a04a008c41eae55852dd77942f97f65848c916
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.md")

vcpkg_python_test_import(MODULE "idna")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
