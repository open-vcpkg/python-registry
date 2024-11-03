vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    requests_kerberos
    VERSION         ${VERSION}
    SHA512          1c5238793b3414f9e59e66333ae3921433628a479b337fbe455fce6393f832411ef5d8836618a7080b2976c2776d03fad67d3964c25ddd21607fc85cb75a1edf
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "requests_kerberos")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
