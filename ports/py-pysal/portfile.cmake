set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pysal
    VERSION         ${VERSION}
    SHA512          7bb3377204ff68f68ff68835febd21b84b86038e3b8e8f6ef2c966e9938ad5643b97d8ce28fa05b865c8d08826d69757bcbd0618b492abbed1fc1603ed3dcaa5
    FILENAME        pysal
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

vcpkg_python_test_import(MODULE "pysal")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
