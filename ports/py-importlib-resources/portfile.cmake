set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    importlib-resources
    VERSION         ${VERSION}
    SHA512          8bc2ea45bf4d5e7e10a42abd79276c1c66229cd5a04375488e7c62d05b1743e60ce7fafb1552014f6a7dfe70969995b7a8bc12118ff051c95180ffa0e90b9190
    FILENAME        importlib_resources
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "importlib_resources")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
