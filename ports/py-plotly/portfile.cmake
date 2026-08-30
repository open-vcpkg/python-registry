set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    plotly
    VERSION         ${VERSION}
    SHA512          e095aace1cceb207a187ba1416c61e0b9df227fcb5b7291c12f770e5c0969bfdb911645ebc841ad5f898a41edd0f66118776f4f4a75656e6608566706a9ad68e
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

vcpkg_python_test_import(MODULE "plotly")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
