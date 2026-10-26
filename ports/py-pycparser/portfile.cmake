vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pycparser
    VERSION         ${VERSION}
    SHA512          59ff647f5e902b275b53e9abfad84d1791832be49800ffda82115dd12d0fa780800c163cb12109e247bc6507fa9d58a585edf46e7a614e820c8d0b4335d60a06
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "pycparser")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
