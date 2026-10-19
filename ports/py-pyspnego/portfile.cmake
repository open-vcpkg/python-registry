vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pyspnego
    VERSION         ${VERSION}
    SHA512          ae24f43d0d2936c425158c2c5d807785bbe7dbc2b2c50477ffd413fcb851893ffc62412c684ce267551c1b87c6055929baec3ff74bbda37f7d9e004b4ceb82ba
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "spnego")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
