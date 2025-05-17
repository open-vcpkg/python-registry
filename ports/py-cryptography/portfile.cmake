vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    cryptography
    VERSION         ${VERSION}
    SHA512          505c3a4275dbaae827ebc7c478d3196c9a2bef71e460a391d56ee53b7ff8a054f7ac81c1a8a4a59829d04dd9a434c123df948627ab8f07ec39259ea0498a8c69
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
