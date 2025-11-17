set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    attrs
    VERSION         ${VERSION}
    SHA512          fcd14ff79a09a0b2b56734c460b5c43836999b6ed27665038ff7a146f53891b31ab3da07df05f1686474507f342bfce09bc0a6a60865c241e58f7ce8423dc968
    FILENAME        attrs
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "attr")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
