set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    cffi
    VERSION         ${VERSION}
    SHA512          907129891d56351ca5cb885aae62334ad432321826d6eddfaa32195b4c7b7689a80333e6d14d0aab479a646aba148b9852c0815b80344dfffa4f183a5e74372c
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "cffi")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
