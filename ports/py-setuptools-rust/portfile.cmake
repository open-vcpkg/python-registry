vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    setuptools-rust
    VERSION         ${VERSION}
    SHA512          be84fb1cead178c1485488e97b01e4eae7f9651d647353abb5370d3b2ff5e44bb1bda4cd90a45d42c567c7e99e630c171e4eb9d01a2793005b66768ee17765e1
    FILENAME        setuptools_rust
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "setuptools_rust")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
