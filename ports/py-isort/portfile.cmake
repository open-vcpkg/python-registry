vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    isort
    VERSION         ${VERSION}
    SHA512          92e27bc00beb2e78284c3ff09e343fa81f9fcbfa9723e1f7e333d49a568de615da0b1b41726b8a50ee6d86e33fa5fbc9449ad6de43b8f72e6281b36b6981cb9e
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "isort")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
