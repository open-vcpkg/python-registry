set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pathspec
    VERSION         ${VERSION}
    SHA512          1004dc55111a4cbf8767775894ed79da465598cd700afbeb96f6ef1f997dcb43cfba8af0b0a1de6232da9725a6e08577ce531da7faa16125c2b7bda0a378d5c3
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "pathspec")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
