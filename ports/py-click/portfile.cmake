vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    click
    VERSION         ${VERSION}
    SHA512          04285f116af65a0f084a00871038514829476ecf8b8d35d407a03eda4c24fc6462b90129b6316bd9a880d22e86656fb97338d7f054143b38612218d4f3930d15
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "click")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
