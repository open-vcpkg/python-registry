vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    contourpy
    VERSION         ${VERSION}
    SHA512          de3f6dc930bb752a3cf8d2244fc15b20061380dc84de11c847ad534ac92eb56049448e397c54831f735ac02b42387ddfa559d4aad3699cb765b03e2cb808efe7
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${CURRENT_PORT_DIR}/copyright")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
