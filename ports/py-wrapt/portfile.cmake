set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    wrapt
    VERSION         ${VERSION}
    SHA512          66d6fd65c08cbd39ebbd8d53593c5fcf13dc50b16fda2332d6faa0cfc029a23e7310593b321980be74b1a5036b6769695be2c8e5f81799292d823a160c4edb20
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "wrapt")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
