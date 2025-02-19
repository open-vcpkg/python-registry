set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    trove-classifiers
    VERSION         ${VERSION}
    SHA512          776082bbc7aac7fd4219fe9641261b439394b45ffb7b7f2e639e3f2fe583faa4594dc0113fd3ab3197035fa72c94ab378078023a6534721e640c01e9e5ce249d
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
