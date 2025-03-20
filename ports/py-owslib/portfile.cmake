vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    OWSLib
    VERSION         ${VERSION}
    SHA512          2da371b8adeef035dd6234daddb5936e9eb70ea43ebb26adac63589486965b9761c23867542f73d0cca4484df009c09b6b27e4a73c1e9a45428222dc3a0fd031
    FILENAME        owslib
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "owslib")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
