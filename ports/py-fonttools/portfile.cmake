vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    fonttools
    VERSION         ${VERSION}
    SHA512          ec373d2f71d46821b9ac6b2d91aaa6a56d7c019aedb601cf9cf9040329ee3903b35fb9c6a7fdbf8f598f1f1a00de021f98b380b40995fc5c52e74a51fc2254df
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${CURRENT_PORT_DIR}/copyright")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
