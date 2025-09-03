vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pyspnego
    VERSION         ${VERSION}
    SHA512          0fb6d0c7f07a9ed0ab10ea5bf771acb7b99d91c6f3031faa5451520004fcc6868751f86725a3b8a75078d6396ffae60669a40fca46f24853587922d01ae76e52
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "spnego")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
