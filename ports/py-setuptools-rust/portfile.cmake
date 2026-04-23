vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    setuptools-rust
    VERSION         ${VERSION}
    SHA512          f8af3b27e85ec4cb0197bac05a8eaa6dd294aae78030d589364fc2179591967d5c959c8e59463af31b8f4660988aabb08174982737ccc386930555b876942eba
    FILENAME        setuptools_rust
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "setuptools_rust")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
