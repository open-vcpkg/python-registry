vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    Bottleneck
    VERSION         ${VERSION}
    SHA512          6aa4a275b21b9c423ec963c4df9c8fdda94be28801804331dde02969aca1cb67835f1fd9b508cfca75917dc99fe0be6e9d2a149796b101ba1a7d2385669bc531
    FILENAME        bottleneck
)
vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "bottleneck")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)