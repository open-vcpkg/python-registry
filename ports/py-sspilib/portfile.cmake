vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    sspilib
    VERSION         ${VERSION}
    SHA512          cdb9dd7ea30c37f99d2db143b914ecdc198e98c2d3c286e60123205cd6767909c90dc08e5f1f0d0ce2d42d80907c015560192155dc7cac9ca94367d3e0985f23
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "sspilib")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
