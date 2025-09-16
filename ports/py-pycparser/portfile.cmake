vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pycparser
    VERSION         ${VERSION}
    SHA512          317f02bf58482b9d80b7395fe6fe5f756230915473b65b219755ccf0f4f1d3b227f508925fcf81fe28bcd6c113cf93e0075bf16a9a499cb306e1627222b1b1a7
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "pycparser")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
