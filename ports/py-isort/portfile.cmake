vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    isort
    VERSION         ${VERSION}
    SHA512          dd08897c11a4e6e9d7bd19655fcaec92ca0e8d635abc34e259530bd15fafb948982a0988cf5cac9b98c95abd75144b4c649f530e91926e550d981a50d3d1f168
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "isort")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
