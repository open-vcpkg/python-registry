set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    jsonschema
    VERSION         ${VERSION}
    SHA512          292f8345044a9d94d0a355b531b9310f94e5811de7b17b0bdbd2e9a6ff72fcddac8d43c3d3ccf457a5f01d5e359178698086f04190d496be3bb663cdf39690f4
    FILENAME        jsonschema
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/COPYING")

vcpkg_python_test_import(MODULE "jsonschema")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
