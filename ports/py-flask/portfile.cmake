vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    Flask
    VERSION         ${VERSION}
    SHA512          4eacac745cc285d82956a040385ec08d134ef639a7fe802a0bbb8b8d92e0c341668eed3ab49eedf4500796b7f1d54930e6a94515f88daedb39928fdbc693ac9b
    FILENAME        flask
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "flask")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
