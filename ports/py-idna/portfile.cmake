set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    idna
    VERSION         ${VERSION}
    SHA512          abeff925d95de523a393b460b5865bed8871c670149f8229adb06d49c08459ff2c2f317c49f614b03218fa11b4ec1f1b6fa2d407a634711506b8f166d4aa6020
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.md")

vcpkg_python_test_import(MODULE "idna")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
