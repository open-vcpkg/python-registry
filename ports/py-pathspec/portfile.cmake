set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pathspec
    VERSION         ${VERSION}
    SHA512          18796c3f654b6e05a43fca0ffdf4667b37663844967ef1a22f7597befd35472a85026f66217e5775e7f9e6e05554e98fc770d43fa34da78e82811dfcea08e167
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "pathspec")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
