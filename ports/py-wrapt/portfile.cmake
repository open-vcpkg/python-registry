set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    wrapt
    VERSION         ${VERSION}
    SHA512          e134ac2ef8db889fb14596d543faa2be076bc383cb0f16734ca08e8c80f5570b6bd65cc9475d99a707290fc9ead07debbe9714120b404f9b244b700e79b19f88
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "wrapt")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
