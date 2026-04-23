set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    idna
    VERSION         ${VERSION}
    SHA512          831ed3e23808dd85285973e9ac7717dad0dd4dbb5aeef6a0532fbc04b41c0714ce83cdc1a8efb6c8311a0160ce00abcbb8ff7064633e2a2bde32c0c2017e39b5
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.md")

vcpkg_python_test_import(MODULE "idna")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
