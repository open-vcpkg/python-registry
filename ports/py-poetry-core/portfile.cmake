
vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    poetry-core
    VERSION         ${VERSION}
    SHA512          cfac336f15af3cad8fae78e55e354ab86a2157d603bb4f656c625749c44d68419544fe769da422571b58eab22876d1ef3672df1f7f4ee08c132e2928ec99225c
    FILENAME        poetry_core
    FILENAME        poetry_core
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "poetry.core")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
