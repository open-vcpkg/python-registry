vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pip_system_certs
    VERSION         ${VERSION}
    SHA512          61789875eb88c0b67b5339237ecfa17d63d91266ec39b2c6a6f21fc7bb31e73d41b6a2518a959a50e7b36d9676d6f7fb3750136a5b9c0fa7b7003eb04bc8350b
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "pip_system_certs")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
