set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    rpds_py
    VERSION         ${VERSION}
    SHA512          326062aa5cffae52b65d697a101d72dff15fd7d684541936a89e4c69c2c5b6b6bb6c4ba7a0a62639a65b36e7d8c7615b515b6965ca42f699c4dfe036a2786c7c
    FILENAME        rpds_py
)

if(VCPKG_TARGET_IS_WINDOWS)
    vcpkg_add_to_path("${CURRENT_HOST_INSTALLED_DIR}/tools/python${PYTHON3_VERSION_MAJOR}/Scripts")
else()
    vcpkg_add_to_path("${CURRENT_HOST_INSTALLED_DIR}/bin")
endif()

vcpkg_get_rust(CARGO)
cmake_path(GET CARGO PARENT_PATH CARGO_BIN_DIR)
vcpkg_add_to_path("${CARGO_BIN_DIR}")

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "rpds")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
