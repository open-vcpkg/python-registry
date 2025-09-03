vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    sspilib
    VERSION         ${VERSION}
    SHA512          a88ad8d05e52c99ac0429c0f77ebc131adf8506a411ba75b0d781858353dfddd7d5ea694e54c7062664c877954a26ed0fd6ea4b2bb631e00c98d9f279d96ec55
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "sspilib")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
