vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pyspnego
    VERSION         ${VERSION}
    SHA512          cf063252f9c37f56c1ebe586eded81d10c88eb24bd48af6b61d36fa6f825e031a70fbf2195f20b98ef0b2f786de9dc99d09da653201332130b291a298fb21ffc
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "spnego")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
