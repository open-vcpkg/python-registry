set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    trove-classifiers
    VERSION         ${VERSION}
    SHA512          a84ee9e3ff20664b433bd07835e0050fa9cd149d18bbcbd2514abb8f1d056725788c64e37c8863b779070728795f5aa01c0a38b8088082ddc37a10629b9ae492
    FILENAME        trove_classifiers
    FILENAME        trove_classifiers
    FILENAME        trove_classifiers
    FILENAME        trove_classifiers
    FILENAME        trove_classifiers
    FILENAME        trove_classifiers
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "trove_classifiers")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
