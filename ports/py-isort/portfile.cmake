vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    isort
    VERSION         ${VERSION}
    SHA512          78274fb9876684abed3821673245d061bf3fb2b884fca487c8920a96736fed573fa7747284dd6c075f2712b83513de08352d46697d4b7b863b63d4fbbb21322a
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "isort")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
