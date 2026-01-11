vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    Werkzeug
    VERSION         ${VERSION}
    SHA512          eb76c4b1af04af6c3cdf4fdb0a21df52b1b8414466620d80ad0e284a9ebd22a4ff93d8028b5cb1b7caf5a3fcc079de61aa90030282bb647018c1b53e90c77360
    FILENAME        werkzeug
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "werkzeug")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
