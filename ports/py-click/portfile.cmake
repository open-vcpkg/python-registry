vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    click
    VERSION         ${VERSION}
    SHA512          f5a328993d3c9493e50a82409ad1d28f696b69e8eaafe2cd3a368b2e270e6430c14190a2a308ab8755616683aa3f6330802d76628112d529daab57f99ae078ac
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "click")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
