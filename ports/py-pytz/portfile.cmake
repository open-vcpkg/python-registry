vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pytz
    VERSION         ${VERSION}
    SHA512          b980715c2bf344734c7c2b1b83e94297a8a501b76e6e728553d99ddc1726aff4eb972c025e482d7dbbd4f11f706b573b5e7a1c030c315fdf556f7ca524436989
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "pytz")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
