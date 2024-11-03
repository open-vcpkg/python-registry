vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pycparser
    VERSION         ${VERSION}
    SHA512          c9a81c78d87162f71281a32a076b279f4f7f2e17253fe14c89c6db5f9b3554a6563ff700c385549a8b51ef8832f99f7bb4ac07f22754c7c475dd91feeb0cf87f
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "pycparser")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
