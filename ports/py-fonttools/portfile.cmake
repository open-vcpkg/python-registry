vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    fonttools
    VERSION         ${VERSION}
    SHA512          eb5696163940645744f6d87716c55811af999e38441c69c8ac88797827c22047ba5a950f3635b5767b482dd13f2cbb2cec6790fffd48ada17b3b7689c6822c4d
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${CURRENT_PORT_DIR}/copyright")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
