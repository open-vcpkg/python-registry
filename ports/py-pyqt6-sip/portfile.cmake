set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    PyQt6-sip
    VERSION         ${VERSION}
    SHA512          d54d0d4b4ec63ceec66bd20809d593979ab15f48d843c4d4f08e078428bf7633c6e6f2752631236020aa07f7095cb519efe1dbd6c9b81a5beb08404f1dbe3f88
    FILENAME        pyqt6_sip
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "PyQt6.sip")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
