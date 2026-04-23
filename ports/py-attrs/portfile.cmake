set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    attrs
    VERSION         ${VERSION}
    SHA512          f9ae9f3a3d313c5f111870d14308fdbb3e2d75a077e76a3b8304d6b9688902c256d7d5b097eaa41e674c29db08c5034e635ee564252096c62f64b6b817f145ae
    FILENAME        attrs
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "attr")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
