vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pycodestyle
    VERSION         ${VERSION}
    SHA512          3ea16619da83f7271b4e64c19317b902d12d223ecd6b3d6fdbfe4087a659b5115628db0ad248d334025439f827f4aa872aabd90f8f002594d923a6ff2adbdb76
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "pycodestyle")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
