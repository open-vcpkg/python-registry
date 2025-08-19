set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    requests
    VERSION         ${VERSION}
    SHA512          2fbc05f5b638cefe59b9edaac86d53666d0416cebdbe8343caa818cae677a733c1f3a9ae62ef5c880b77cf706a2e3da57e0783d8936bda128f071367524189de
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "requests")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
