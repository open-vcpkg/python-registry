set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME        trove-classifiers
    VERSION         ${VERSION}
    SHA512          7d67947c12e2fbe8a3d380e50e22671cc538593e0bf752955b84f74018c364dcc56553727dc53a540da713df5db73601acdc1e1cd608f55a968b9ec48a04d9ee
    FILENAME        trove_classifiers
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "trove_classifiers")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
