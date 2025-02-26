set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    ephem
    VERSION         ${VERSION}
    SHA512          fc0aacd15e080b57b9ee9c17cc50ba839b91968bc2787b7a4c018a7d3b16d07ee927b6e85ecf63cde294b99a3c4d6618876067bfecf661e9ba4e08e63513c81c
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "ephem")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
