vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME        Werkzeug
    VERSION         ${VERSION}
    SHA512          1c1e7f6a2e08aaf5a41f99dd41193cc1177a01242c9281cb7170db84fb193b15a1c3291ef039d8660ac35a89cc6fdf2664f15f742085305a46894f2a2f331976
    FILENAME        werkzeug
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "werkzeug")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
