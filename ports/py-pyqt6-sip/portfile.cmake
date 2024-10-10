set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME        PyQt6-sip
    VERSION         ${VERSION}
    SHA512          6947690e61fe65a21f61d034ae9de7b7adb001c59a4a362933c5441648fe27140b43666efa73f981b138cfc73fac72777bb7318b98accc3c7f808687e3fc5d81
    FILENAME        PyQt6_sip
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "PyQt6.sip")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
