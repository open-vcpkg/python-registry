vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    isort
    VERSION         ${VERSION}
    SHA512          edf386ec3497c1b9e540015dea76f8328593f43d2aa391acad459f175fe1b3a552d4ca0e75187bc92ef1319cb4c77bb774cb22ef9b46cf89daacc754bb454f93
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "isort")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
