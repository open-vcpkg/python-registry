vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pycodestyle
    VERSION         ${VERSION}
    SHA512          0ab7547d0c950b3bdad4dfa85ed3ac3710dc6086fa79e8b965bccb980d63e44bf4fc2d06e62e11698db95300c3bb9b9e501e34f5991364bcd7f8e388aa8ec154
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "pycodestyle")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
