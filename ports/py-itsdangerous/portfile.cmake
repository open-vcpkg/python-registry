vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    itsdangerous
    VERSION         ${VERSION}
    SHA512          ed046cc371ea9aa1f7cd3bd201f1b68910a2b008bd8434c425332cecec6539cf031df6e2223a1fdccd68c12ccf5486e80f178d5906911b19417f0ea244e367f8
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "itsdangerous")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
