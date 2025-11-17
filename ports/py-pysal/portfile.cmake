set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pysal
    VERSION         ${VERSION}
    SHA512          81be0d4a52f9f0b169df705b872435803896f754e674c7eb999118dde4f086077d1da777f0056f3ae4fe333669acbb778978bc280af832acb9ed53d93283c9d2
    FILENAME        pysal
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

vcpkg_python_test_import(MODULE "pysal")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
