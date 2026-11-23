set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    soupsieve
    VERSION         ${VERSION}
    SHA512          69f2c22a86998fcf8b4a46122e11f297fe8e616f5287dcc14862b84269dbaf008c84e0f29c8e5394a529619e20e894f0f1eef7b61decf0f7ea1b6206ada884a1
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.md")

# No import test: soupsieve imports bs4, which depends on this port. py-beautifulsoup4 tests it.

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
