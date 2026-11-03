vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pydantic
    VERSION         ${VERSION}
    SHA512          7f1a57e726773d190addf6663c2393e7aa883c08709391c93158ab9cb30504025526ac9c0b07ad4401271e45874c0ee178f7fa6527f8310affcc8f1826cac3fd
    FILENAME        pydantic
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "pydantic")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
