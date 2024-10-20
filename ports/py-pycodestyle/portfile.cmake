vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pycodestyle
    VERSION         ${VERSION}
    SHA512          e2a5a10723a2606e49674c4782b50f65ad4d02238e9251fff3d8cf4332cc8df665740265b687a3ec3f9e1e5e03e5787bb82c599ba31dc3c408f32bab353cef71
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "pycodestyle")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
