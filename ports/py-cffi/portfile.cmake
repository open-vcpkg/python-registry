set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    cffi
    VERSION         ${VERSION}
    SHA512          44c5e434580ba5ff1f2c23bbabe959d49e77a8823648eaab631c46f175c2b4ff3b96d5976b66ef33b93537674a1ba01e355cf836d40de7e2c0557a51f5fc7959
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "cffi")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
