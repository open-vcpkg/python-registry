vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    geopandas
    VERSION         ${VERSION}
    SHA512          901ec9a16786872f673cb917bd37ff0790e0582b3738253cd73f0dec3f6bd2c1700cfcaeb4f0f2db87f01940521cb8401d1c511ecdfae98ddb5bce1fa500e941
)
vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "geopandas")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)