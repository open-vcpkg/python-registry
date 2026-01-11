set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    jsonschema
    VERSION         ${VERSION}
    SHA512          a7ae00392b8deb742f5826a65bce0a9149a67c6ddc4deff0bb2e99a79ed94f02c4738d93fef5247e30016fa38397ec68ecdead1c1d76a0caaf7755941544a0a2
    FILENAME        jsonschema
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/COPYING")

vcpkg_python_test_import(MODULE "jsonschema")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
