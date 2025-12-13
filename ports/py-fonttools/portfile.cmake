vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    fonttools
    VERSION         ${VERSION}
    SHA512          a10a6463cae7d23740b333a0186c6f3e2e0e44fd194f7805dae271bcada0be8ac5701245a6ca5cb6f47e73bfbb9bfc600c9631f8405509827ab49115b5ee0d53
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${CURRENT_PORT_DIR}/copyright")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
