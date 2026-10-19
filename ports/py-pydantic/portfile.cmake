vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pydantic
    VERSION         ${VERSION}
    SHA512          f5c0f0f856e4a9cb50482b4a9ec1366a11b16a996d480addec22738b07648cf97f33f44680cfea203ee7f773facfdc899b40d6096f65b56c615e30ce4dc6bd48
    FILENAME        pydantic
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "pydantic")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
