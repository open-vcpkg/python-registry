vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    OWSLib
    VERSION         ${VERSION}
    SHA512          f320e0054dde9ff76fb75c938bc9648cabda4b8bd0e6fd79affa2461ff62159953278d39686e3d91724ba6417d35a4c9e83d44b703f12072e39d21d5f5b6ffca
    FILENAME        owslib
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "owslib")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
