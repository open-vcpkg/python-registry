set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    trove-classifiers
    VERSION         ${VERSION}
    SHA512          af3c0ee51e7ce3e7ec0eb1fd901ac3d0c02f6c0ba1c77d3ba66e0770bf5300144f636dcbf608f046a21789cfc780f651be222b7d23f359a672fde0210af966b5
    FILENAME        trove_classifiers
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "trove_classifiers")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
