vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    adbc-driver-manager
    VERSION         ${VERSION}
    SHA512          ea8556003f5301d729eadc139efbb464797eac0bfd07ddb13c9ec637fd945214cbed951b2844cee9bd52d0354a57575dfbe17e3aad21fee902becd7774b49b14
    FILENAME        adbc_driver_manager
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "adbc_driver_manager")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)