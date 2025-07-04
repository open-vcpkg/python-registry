vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    Flask
    VERSION         ${VERSION}
    SHA512          b582b71e10f72c2096f4a665a8182775165f48eece8bcded9ca5791bc575e3333ac913fb355279f0bee93fc57c16f9a8b635b329bfd71ed42df2b288c1a69741
    FILENAME        flask
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "flask")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
