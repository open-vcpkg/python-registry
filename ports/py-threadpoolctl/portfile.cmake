vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    threadpoolctl
    VERSION         ${VERSION}
    SHA512          1fcc39a643db15b7415ad81206078d5ec571d99bab2a8b6c63180f45ce43479876700e3eb36a317b51df18633b2c5455d54553dd710a9c9a8ce2f77bebd5792a
    FILENAME        threadpoolctl
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "threadpoolctl")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)