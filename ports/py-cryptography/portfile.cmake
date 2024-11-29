vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    cryptography
    VERSION         ${VERSION}
    SHA512          d0aaa2160a31079412ddb7be07fd170c7e54736c315b6fbb6ee5264af0eb90be392ecd1c0e3bfb4ea071c0153ad8f47604bd6b28d4297cd9774dc55647b4e97e
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
