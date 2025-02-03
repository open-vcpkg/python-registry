vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pytz
    VERSION         ${VERSION}
    SHA512          d571c70c83c5ccc6db661e2f97e990a6490b07b7597ce5813e3a3a1e2e49cd83301f8f59205b9557f3f34e7bdc9435961cf55e630c4452d6e251e3f6db263659
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "pytz")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
