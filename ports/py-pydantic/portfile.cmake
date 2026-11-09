vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pydantic
    VERSION         ${VERSION}
    SHA512          6be87cedb563a78f683c94fafc68ceee68d4c72a69b5ef1eaa52235a90e661fd951bf21078628e67f101819ffc203e38af0e6cb3fe80d4a9a914698b54ecffe2
    FILENAME        pydantic
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "pydantic")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
