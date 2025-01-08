vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    maturin
    VERSION         ${VERSION}
    SHA512          6130ee1fd859d118a4f00df00c84e5c30483864d2bebbe7984798783cdb85066bd5aee759c6c8541b2a3bf2fb10b3437c9112ae6c4e10479e16ab15e9b75f19f
)

vcpkg_get_rust(CARGO)
cmake_path(GET CARGO PARENT_PATH CARGO_BIN_DIR)
vcpkg_add_to_path("${CARGO_BIN_DIR}")

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/license-apache")
vcpkg_python_test_import(MODULE "maturin")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
