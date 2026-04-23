vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    Werkzeug
    VERSION         ${VERSION}
    SHA512          78c1a4fe38b5e071defe7003af58bf50c38a5cc8132641c69e9ecaaa6ddba00856919082c239a1f1c8eeb2fe44e2a5d20a769baffc8ce3c110450461517eda87
    FILENAME        werkzeug
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "werkzeug")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
