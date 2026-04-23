vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    platformdirs
    VERSION         ${VERSION}
    SHA512          90030693cbe91f05702902787ac35c61aa4818189dbb5742f1d662b501584bd63d9b978367d826b58ca30d42e8479db86b479a0a6549c66a10a6409b96329ff5
    FILENAME        platformdirs
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "platformdirs")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)