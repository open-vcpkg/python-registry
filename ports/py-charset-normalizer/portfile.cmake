set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    charset_normalizer
    VERSION         ${VERSION}
    SHA512          7b7098d389bf4b181bd26037fa439abb44811ee68b01b78bfd399b4213cca7309d4878e90a0983d6aa2c550c3b9b355c8b5157fae731981f3e6e4028a911d143
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "charset_normalizer")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
