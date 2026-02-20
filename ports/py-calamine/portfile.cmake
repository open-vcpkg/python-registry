set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    python-calamine
    VERSION         ${VERSION}
    SHA512          f76be183793c34bb6311e6856ac47d0ccb6c11eba0a287cfaffc3a79ec3e4f526d079f798bbf7ab121e9a505ca6fd8a53b4c69fe8a64a046b69c43b93ac51130
    FILENAME        python_calamine
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

vcpkg_python_test_import(MODULE "python_calamine")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
