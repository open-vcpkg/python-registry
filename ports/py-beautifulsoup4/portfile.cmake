set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    beautifulsoup4
    VERSION         ${VERSION}
    SHA512          71615985822a10788b3fb51b832cef0ee7b95464e64e08302471cc68b42924c5d6561c3a355ea211d963c65a46a92d3e5128fb05df653c7bead8623791cae3cb
    FILENAME        beautifulsoup4
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "bs4")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
