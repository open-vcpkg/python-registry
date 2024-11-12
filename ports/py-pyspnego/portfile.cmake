vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pyspnego
    VERSION         ${VERSION}
    SHA512          6e2a16b538d5c078842db1629628b13257a900c51778b9186f4edff33b4e932eaff2a8ccad41b50a8a89118283059fc716cfc92dfe423ed1ead1a22e6a172a9c
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "spnego")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
