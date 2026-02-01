set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    wrapt
    VERSION         ${VERSION}
    SHA512          4e20da9d29284f3391c983772482ac8f1b371bc3f6020765f77c54df9842287ba90242069dadf819fb680ddc9378515ffc27f99f28a5f3ce18d70cab3ff7d017
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "wrapt")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
