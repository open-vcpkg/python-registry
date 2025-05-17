set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    trove-classifiers
    VERSION         ${VERSION}
    SHA512          ee858f52c08b867fe4845ebb19f9b431308d216b5313e2bc030d63340860205d40125ef6cee218f734ccd49e5ae36011c8e3415f03d0ace182cb518ed5f2318d
    FILENAME        trove_classifiers
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "trove_classifiers")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
