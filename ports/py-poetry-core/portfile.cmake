
vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    poetry-core
    VERSION         ${VERSION}
    SHA512          07452eb3d5c640891be58d7d882be327ddb38e4d59499ca2100c854640c174f666e1175e8bb739a31631b5df44b04be0354b7bc59878340cdda3a30f9f2c3dfa
    FILENAME        poetry_core
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "poetry.core")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
