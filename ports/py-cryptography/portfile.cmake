vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    cryptography
    VERSION         ${VERSION}
    SHA512          5bc5ea5b85c600504c46e2376a45cee749f41e2b4a6eb639b05d289370dcdc82b2ace423532f5591da16ca56ea32919e47ec154cb72bf7e1f5f3f923c744a185
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
