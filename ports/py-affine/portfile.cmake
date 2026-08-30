set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    affine
    VERSION         ${VERSION}
    SHA512          64f79e4305d2b38b51f083613c536f4cdd390ff1d4686fdd7859070f6b3b6c588c2730fc6f47c894c5e70aa7ce8dfeb04eea64c1354cce414937c238a009ce8d
    FILENAME        affine
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

vcpkg_python_test_import(MODULE "affine")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
