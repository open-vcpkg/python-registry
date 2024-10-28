vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    cryptography
    VERSION         ${VERSION}
    SHA512          965ecdbdac09ba4cf3d3289cb7f0997bfb9abd61aa663554f27651328e5da1c92edadba521b1bf779e245255e5db3da7ea8092496f845b73278ffcdd91076bbc
)

vcpkg_add_to_path("${CURRENT_HOST_INSTALLED_DIR}/bin")
vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "cryptography")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
