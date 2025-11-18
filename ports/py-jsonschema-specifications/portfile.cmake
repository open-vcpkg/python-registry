set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    jsonschema_specifications
    VERSION         ${VERSION}
    SHA512          333efbd81ad787da841fe8526257b4213bff508c91a6a655f2dbe62b22a0347ac8f97230b52e00aabcf626e91026a6c2f5760d54c2078eccd2f033a8599e7484
    FILENAME        jsonschema_specifications
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/COPYING")

vcpkg_python_test_import(MODULE "jsonschema_specifications")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
