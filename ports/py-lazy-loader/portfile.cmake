set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    lazy-loader
    VERSION         ${VERSION}
    SHA512          3274ef7695f74cf9cc981ed7776dfd8266f11910247bc9a263537f3744d4fbf00cb64ba1694e92879c5ece2b0832bc6af81803d244fc7b1004d5e4c6d08f6402
    FILENAME        lazy_loader
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.md")

vcpkg_python_test_import(MODULE "lazy_loader")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
