set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    PyQt6-sip
    VERSION         ${VERSION}
    SHA512          9697ae8a1b2dd8edb41642da2db30a5bb90886dc71033345aa1f12ca52f2a2784b8f181be65fd953adfdc9482c59c32a8c14f3334b0c242cdf10cf3bdf08d336
    FILENAME        pyqt6_sip
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "PyQt6.sip")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
