vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    geopandas
    VERSION         ${VERSION}
    SHA512          bb30bde9150b792272b9d2e2db39581c7de196fffbac5e60bceb2a430378c5be9228ec6e5fa159a61389338565ec2c8a0cafff69570b88cc018d193dc1452c47
)
vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "geopandas")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)