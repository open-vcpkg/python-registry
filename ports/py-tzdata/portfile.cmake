vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    tzdata
    VERSION         ${VERSION}
    SHA512          7fd9177af9481511a169ac521c763fccd89c19613c810b1569bbcb7a2a1f7256cdab3bfa1df582e3ec7e3c547dbbf1be1693184f2e9cbc3dff107b7fd5daade1
)
vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "tzdata")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)