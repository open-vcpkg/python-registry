vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pycodestyle
    VERSION         ${VERSION}
    SHA512          eca00f19ac2036dfc7d78da7cbda7b57e8f2aea961be49ef88d03dbc7cc158e69a6953e03cf78e7d7ce5706ccaff6afc04d3cf550b997c00dfe18f5f18692f56
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "pycodestyle")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
