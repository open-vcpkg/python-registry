vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    PyYAML
    VERSION         ${VERSION}
    SHA512          0df64497f51bd07ee01d7676afc4cf3eff228e1a73d4b1c7f034c7cba762f3451aa686e594af54e8e359173262cc0e47c110491bc7e29c3dd712a66c4316b2cf
    FILENAME        pyyaml
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
