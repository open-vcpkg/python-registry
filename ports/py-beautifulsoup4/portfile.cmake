set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    beautifulsoup4
    VERSION         ${VERSION}
    SHA512          5c535534045cac033112b7c060539d6b5a748620df9d15fb4c719708cde263ac506f3734a39156681633942543dc555af51c619dae430311a8889204d8ee325e
    FILENAME        beautifulsoup4
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "bs4")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
