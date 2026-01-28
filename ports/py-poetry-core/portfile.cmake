
vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    poetry-core
    VERSION         ${VERSION}
    SHA512          6bf2e33d6f7268eb0c598fd64eade580f410d68c1669663d2a472675a04b1a09dc23a97bb7fa9c9a13d9eca646a560a4907faf08d5494dc9a0a0572134f10baf
    FILENAME        poetry_core
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "poetry.core")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
