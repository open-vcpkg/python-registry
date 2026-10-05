vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pytz
    VERSION         ${VERSION}
    SHA512          e4950a00d4a4ad7812210f7d914d3b4b809eed8b9cf5b612b27c32fecbdc0ee72093b8c5f6ff4ffc8b6462ec65762951e4029c70084afef0ca2501c09362d600
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "pytz")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
