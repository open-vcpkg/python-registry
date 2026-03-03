set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    ephem
    VERSION         ${VERSION}
    SHA512          3b5c01e7c1491ab5b7eb28676da74ebbb2235297a33cad5b91340e2056a34eda9075b6ca3f92b4bc1f8bc064ede84bc9c61bda71cb9af345e3969e0316405dfa
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "ephem")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
