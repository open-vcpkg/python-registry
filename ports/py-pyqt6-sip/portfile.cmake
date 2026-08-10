set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    PyQt6-sip
    VERSION         ${VERSION}
    SHA512          fecb597444b801efd8e9ef7564cfc4379659104af784f3f6a64320a5cfa4d78cb0860cbdeb266424618c24ab7071d25c24d63218efc84206c8eeb8da0e27bd85
    FILENAME        pyqt6_sip
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "PyQt6.sip")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
