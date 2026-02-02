
vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    poetry-core
    VERSION         ${VERSION}
    SHA512          65b4f606439d31056c75182d9d73d4b48c05fb40bc3aaa956728d9b73f006322567c957b7a6fe27359dcbfa10eb37da99bf10d7219de91c537284a21b5c1c3a3
    FILENAME        poetry_core
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "poetry.core")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
