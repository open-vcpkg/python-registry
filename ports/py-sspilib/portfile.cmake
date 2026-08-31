vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    sspilib
    VERSION         ${VERSION}
    SHA512          d2036d75c19449cabe8e609fc3581d13057669b3f990a735dd7cc0ce714be9251514fd2ab11171b1097a7a67ae314e7e9a7e88484a2374fc1cd06727b403229d
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "sspilib")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
