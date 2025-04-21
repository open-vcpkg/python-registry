vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    contourpy
    VERSION         ${VERSION}
    SHA512          c32f6329a306ecc5df054eadc0208484be2fca86f7c3a158dca813c0c6fab121ab674ea8c9b9fb0a229a03876ce950fb62f3b8adf6cfb6ef8cd7bc4ae1c0d907
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${CURRENT_PORT_DIR}/copyright")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
