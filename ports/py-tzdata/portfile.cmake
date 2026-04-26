vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    tzdata
    VERSION         ${VERSION}
    SHA512          4d2f1cfe01dfd0a5406a1b3647eb3d398429b64e266fdedb0eb2356acbb2a5190c79608afc1c895da1bb490fe40628ed1b96eeed29ae3f97f890e838625de74a
)
vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "tzdata")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)