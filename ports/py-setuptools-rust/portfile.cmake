vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    setuptools-rust
    VERSION         ${VERSION}
    SHA512          60ca0327758bcb29c2b7e2c28f264c9d23f62de049deca0a9e7c284f2b82fbca36d1db09bf3ef940fb688efa6c3969b1c93e08d8da11bb9f6ec40ff48ecefbcc
    FILENAME        setuptools_rust
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "setuptools_rust")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
