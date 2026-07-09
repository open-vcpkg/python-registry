vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    setuptools-rust
    VERSION         ${VERSION}
    SHA512          07f6112b614d0621f4a6a413e3484b3d04772d5214ff099ca33c87e2802d2ad11fa6c6d3e9540643177ba541768a1f12b6759a592b7af53eb10879d78fcb68b9
    FILENAME        setuptools_rust
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "setuptools_rust")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
