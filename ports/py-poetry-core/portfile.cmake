
vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    poetry-core
    VERSION         ${VERSION}
    SHA512          4cd6f91acf108539b478bded2d930947a177b36eaf10bbb25092c6617a2391fc9f4286ef25186642fcd25750967df375c183434446275c91a5b456e972b1c9c8
    FILENAME        poetry_core
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "poetry.core")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
