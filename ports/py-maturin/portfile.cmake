vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    maturin
    VERSION         ${VERSION}
    SHA512          bcc97f7a4a9e6dbaecf3857c17e9e0425f209e8db85b6673ff90c041b991bfe15c25309323a6ba006636748fe87e2105bb4f7f24b047336d4d000c3706ecb61c
)

vcpkg_get_rust(CARGO)
cmake_path(GET CARGO PARENT_PATH CARGO_BIN_DIR)
vcpkg_add_to_path("${CARGO_BIN_DIR}")

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/license-apache")
vcpkg_python_test_import(MODULE "maturin")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
