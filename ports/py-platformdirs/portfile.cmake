vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    platformdirs
    VERSION         ${VERSION}
    SHA512          800732f452cb3a67622b6f633ccadeb008169c69fc5e5bf3e708455d53772f256c32b577f09be7cae16aa8e2d2c507fde5b3344ee0b1a0590cd9c7f51c861779
    FILENAME        platformdirs
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "platformdirs")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)