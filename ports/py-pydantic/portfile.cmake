vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pydantic
    VERSION         ${VERSION}
    SHA512          40aa24453f53310f42b01859077e30ef4107bb4eba9fa07d80306690936b254ab617f5cb19db2d83ebb4de88722546f7ea32ddde459fd4a16615eef874b9732e
    FILENAME        pydantic
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "pydantic")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
