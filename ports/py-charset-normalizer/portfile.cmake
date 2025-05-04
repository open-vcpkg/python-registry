set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    charset-normalizer
    VERSION         ${VERSION}
    SHA512          702d9c23fe68d3538e4f45d5d9451beb02853ecf1ec6b36a7068ed8ade707bd0fd2a1764137381294590d0e5ffc2e296866f402dff33f65ec0458cf1102970fe
    FILENAME        charset_normalizer
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "charset_normalizer")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
