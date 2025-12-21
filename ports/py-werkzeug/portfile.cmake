vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    Werkzeug
    VERSION         ${VERSION}
    SHA512          5d2ad334edf0908024e29dadf88f772ae8f26c0eb24fb10caf6bd09021008aae67ece05703fe2490a34dd72213ad7db4e25921dbaf35d5f256e7a4cd4c9d1619
    FILENAME        werkzeug
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "werkzeug")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
