set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    PyQt6-sip
    VERSION         ${VERSION}
    SHA512          4432ac7fe4e6a8943e4bcd0637b7e8453b3124476f703fc530a5d0eb499d218ccd9886d136ea18e4e078313bd4accf8d239ad865ae05d6ba47c811de40283737
    FILENAME        pyqt6_sip
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "PyQt6.sip")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
