vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    tzdata
    VERSION         ${VERSION}
    SHA512          9fd1a0380c8bd24943c66237ba398ebae953f218006a88499b3469c06f103d7c6376a2f0214ab6d2b41bc7cdc477391a1e471d8e444fb87b98fb9cbf022846ab
)
vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "tzdata")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)