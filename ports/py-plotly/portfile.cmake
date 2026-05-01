set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    plotly
    VERSION         ${VERSION}
    SHA512          a3a54d5e9865d91917d2a20150ceac5c50f03ec673722586db7370a77b6c33453eb0e667cf1eb601f45eb0f2521e27e4f9d8a18e5c3d7d7ef422bf37bc5a36bd
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

vcpkg_python_test_import(MODULE "plotly")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
