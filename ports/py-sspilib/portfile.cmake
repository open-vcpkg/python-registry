vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    sspilib
    VERSION         ${VERSION}
    SHA512          82aabc30a5206ff9764cbd2b8ec5f5006c133bc7c32399eb9917b213daf7512c33de946842a943caa77562954ac421f7600170610489713a6edbd68d481e2eab
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "sspilib")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
