vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    beniget
    VERSION         ${VERSION}
    SHA512          58c0ceb50c83861a3f29e90865597af9a795cfa01dd3f8260af2b6cf01b512a3f95045b0ae439853ffa038fe3b8dd5450583794ee41eb45a94e43a495286a300
)
vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "beniget")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)