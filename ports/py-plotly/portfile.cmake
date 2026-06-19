set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    plotly
    VERSION         ${VERSION}
    SHA512          0b0ec694294ca0b80007f4e84ed0ba09be94d227ba2b9b7109f72c6fa612ae876312fd795cc21d02701eaa2db50d8b78e7ce8edd210d0749690200e0d90beef5
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

vcpkg_python_test_import(MODULE "plotly")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
