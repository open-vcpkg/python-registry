set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    lazy-loader
    VERSION         ${VERSION}
    SHA512          aca2a7a8901dadc2c20a5e23ae016b466dad541153c0f43ed20b57b375c6dc8279a324ea086ed2468e20655dd567a30f9275da7fd8664f6384296bdb739289b7
    FILENAME        lazy_loader
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.md")

vcpkg_python_test_import(MODULE "lazy_loader")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
