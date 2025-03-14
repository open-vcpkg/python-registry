set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    trove-classifiers
    VERSION         ${VERSION}
    SHA512          15e6f8bd6ca8150efb8bc8d90d1c6e3774f9b740dfdd5c7e34870cfc73ca31faa1450bdc9ec26452c383259f5e6171d291d07cdcaf49c87ea9275704faaaa61f
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
