set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    plotly
    VERSION         ${VERSION}
    SHA512          b176dbcf0765c8638089e497e403977b432d2adbd9bec6f77e945f86bc449116d3f0b7bcbc538fbce80dea16d122fd9682deb9a8c58bcb8fd333448debe95bf7
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

vcpkg_python_test_import(MODULE "plotly")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
