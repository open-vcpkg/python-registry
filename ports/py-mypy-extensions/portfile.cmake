set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    mypy-extensions
    VERSION         ${VERSION}
    SHA512          b946d48ff85a2c384049058a3bd822942a91114f818374764722962869e47ae0b86efee4b58b3c14a974e6711a8c1651ca6a1c0a448fa4ea03f9190c63b3dae0
    FILENAME        mypy_extensions
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "mypy_extensions")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
