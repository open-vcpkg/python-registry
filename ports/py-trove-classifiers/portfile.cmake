set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    trove-classifiers
    VERSION         ${VERSION}
    SHA512          2e531939642f0436650cbd12b8d40faa2a32211575c39a23508194ea65c2d0b01ade63fe2c59d6098e6e92f2a6648ded3b55a3d359ff5d5b056722f1af9291cc
    FILENAME        trove_classifiers
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "trove_classifiers")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
