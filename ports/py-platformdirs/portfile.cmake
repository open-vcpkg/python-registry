vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    platformdirs
    VERSION         ${VERSION}
    SHA512          ac87a2ecbed0f04a0230ff9ababad9ec1995da059f84dbc1e3c38f988cc40e5d596a25a0f9471f3882065f131a0d6c1a8c2f0f617cb85e5dbf220d753125a658
    FILENAME        platformdirs
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "platformdirs")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)