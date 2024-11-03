vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    hatch_fancy_pypi_readme
    VERSION         ${VERSION}
    SHA512          c263fe2d73a92ab29da215852d76a1a0c465b821e437fe96aea3f0fe30cee40e3013db01ff50b9dea138c5d766716d217af6bbe89c6a8d6ff41e59ba34f90976
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

vcpkg_python_test_import(MODULE "hatch_fancy_pypi_readme")
