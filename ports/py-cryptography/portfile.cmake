vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    cryptography
    VERSION         ${VERSION}
    SHA512          0d2fd9de7b6cfafef5f66e4fb10b7eaa8712bc0ed7bca19a017963b8ea707813a7bdc841f7d4aa512da7963eff3707792d46cb93058875fcc447961256c32d9e
)

if(VCPKG_TARGET_IS_WINDOWS)
    vcpkg_add_to_path("${CURRENT_HOST_INSTALLED_DIR}/tools/python${PYTHON3_VERSION_MAJOR}/Scripts")
else()
    vcpkg_add_to_path("${CURRENT_HOST_INSTALLED_DIR}/bin")
endif()

vcpkg_get_rust(CARGO)
cmake_path(GET CARGO PARENT_PATH CARGO_BIN_DIR)
vcpkg_add_to_path("${CARGO_BIN_DIR}")

set(ENV{OPENSSL_DIR} "${CURRENT_INSTALLED_DIR}")

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "cryptography")
set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
