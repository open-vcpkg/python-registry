set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    trove-classifiers
    VERSION         ${VERSION}
    SHA512          4863ff031d9c83177099b5c1e04e2a22396055209b88e60dd44e22a8357889f27572444e0a1fbef65b7b37919cb9d7f8cb548b7007fd878d8fe92c9cd39b864e
    FILENAME        trove_classifiers
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "trove_classifiers")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
