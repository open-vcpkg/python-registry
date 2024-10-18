vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    jinja2
    VERSION         ${VERSION}
    SHA512          d07d68a2687af68c705d3b7f5a2c67aca7b9d125316b15085888b9d0d6e769981af76f6f524728b89b5501bd671d518fcb2638f9ae112e57ca2bf2a53482cd89
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
