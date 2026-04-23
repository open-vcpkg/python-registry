vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pydantic
    VERSION         ${VERSION}
    SHA512          fb807b94eec1ac603e515e11e99d1b4c19d31c0008d2ae02f4798eab8ad524202b38a71211f1667b476f38385f7e13f7e16b38a5912081eb5df22402020f618a
    FILENAME        pydantic
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
