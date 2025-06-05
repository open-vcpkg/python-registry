set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    PyQt6-sip
    VERSION         ${VERSION}
    SHA512          19c990d76d095e3af0b18c5d7b5ea9ebdf23230643ec01aa1b4f1ab5ccc421c2b62a1bb44bc1ab6767b7ba5baa74c30e6e7bd2472ee4afb82a4e3db865cf78be
    FILENAME        pyqt6_sip
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "PyQt6.sip")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
