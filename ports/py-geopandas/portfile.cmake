vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    geopandas
    VERSION         ${VERSION}
    SHA512          dad0b7c74df09d0eb95cf76cdcebde88550bf47f27454d3610bfa6936a9f22c60200bcfd187a65b20aab6448d83aef6a3ae1053474165e397d9368b9433ed782
)
vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "geopandas")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)