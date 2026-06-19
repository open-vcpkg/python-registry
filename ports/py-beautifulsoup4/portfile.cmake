set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    beautifulsoup4
    VERSION         ${VERSION}
    SHA512          ccf07cac23ca52f50802b3d6271b42c1367022e2bc409b1be2924bbbd274cebce3b5afde1c1c4f253802b7a58f907cb60a29d347ae2765c33ce85bec9dcc473c
    FILENAME        beautifulsoup4
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "bs4")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
