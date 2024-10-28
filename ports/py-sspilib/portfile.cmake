vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    sspilib
    VERSION         ${VERSION}
    SHA512          02b60679846b3c3ca38f09e68af3f694c15bfcff511624b0c14ecf04898da4d103d4f202c08c893052f219fa42c3f72687300a76cf5859098845252af82b58d6
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "sspilib")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
