vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    Werkzeug
    VERSION         ${VERSION}
    SHA512          f8628364dcd999ab4c50c3c4fbf8de78da24f541d2fb768be313296a116de901c9a8c3001c6280f07a0ffba102f7dcf02658f3f9a2c48517c029df5753d44c35
    FILENAME        werkzeug
    FILENAME        werkzeug
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "werkzeug")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
