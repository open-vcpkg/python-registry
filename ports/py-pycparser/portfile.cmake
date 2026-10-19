vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pycparser
    VERSION         ${VERSION}
    SHA512          6f2be578e646438d8c451cdbd19a97741e6c6cad05f608376f2bae40435afdecaab95d1aa2fa6b9dc7ffc010597c294dfb32154859557c77533e55bc1ddef82f
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "pycparser")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
