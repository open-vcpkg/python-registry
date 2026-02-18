vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    maturin
    VERSION         ${VERSION}
    SHA512          b8fb9a3af405f9113f9da8542e98fe33af55d44cf5cc08022be3548010c4512af40c67e3c149f5836c90e9a490a01a8fcaa6795151e85a6f3fe38c14f17739ef
)

vcpkg_get_rust(CARGO)
cmake_path(GET CARGO PARENT_PATH CARGO_BIN_DIR)
vcpkg_add_to_path("${CARGO_BIN_DIR}")

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/license-apache")
vcpkg_python_test_import(MODULE "maturin")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
