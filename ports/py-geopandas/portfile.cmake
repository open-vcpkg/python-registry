vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    geopandas
    VERSION         ${VERSION}
    SHA512          ea0345abbd41a61ed3027ca3f316fa8377119877c51e17340d64ac02ce3097434871f126b3dc4f0130f032e165b2477795bfdf6d262e703c082b083654060759
)
vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "geopandas")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)