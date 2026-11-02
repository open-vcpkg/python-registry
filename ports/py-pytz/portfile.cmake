vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pytz
    VERSION         ${VERSION}
    SHA512          44e6453347143661842b605a3a02a08d007d40c1f749406d973ff919927c267de20bad69acfe558aa795f7e26eee628423533204f320b570cc535acfe32e6df5
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "pytz")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
