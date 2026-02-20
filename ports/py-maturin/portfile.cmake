vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    maturin
    VERSION         ${VERSION}
    SHA512          588f9df6ed7d064ed6e46152185a1a7c4f04a2b3f3aa76a8622a62aea46f80ad305bb73a13faafb6ff3f45590b755b5f59fa70990651c7e6b0d1f636533d1bff
)

vcpkg_get_rust(CARGO)
cmake_path(GET CARGO PARENT_PATH CARGO_BIN_DIR)
vcpkg_add_to_path("${CARGO_BIN_DIR}")

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/license-apache")
vcpkg_python_test_import(MODULE "maturin")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
