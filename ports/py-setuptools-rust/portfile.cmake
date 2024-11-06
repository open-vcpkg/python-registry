vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    setuptools-rust
    VERSION         ${VERSION}
    SHA512          4a97ece7d42856532c9517ec1cc5ad7d8f765b8b4157ffcf458688478db7b3d1b4aa10898ebedd2251e3d29d80e81b45ad93128ae72bc270794f77c006ece324
    FILENAME        setuptools_rust
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "setuptools_rust")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
