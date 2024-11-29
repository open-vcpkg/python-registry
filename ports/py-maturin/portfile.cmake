vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    maturin
    VERSION         ${VERSION}
    SHA512          a7f52ad964726e0f9cb39ae2189493e087b086e26fa919ffcc8d8b368e4983d0d82a066cd1c20a94fd3a269e17dac1e108dbe92e36a253047d9d30895cfd4c52
)

vcpkg_get_rust(CARGO)
cmake_path(GET CARGO PARENT_PATH CARGO_BIN_DIR)
vcpkg_add_to_path("${CARGO_BIN_DIR}")

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/license-apache")
vcpkg_python_test_import(MODULE "maturin")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
