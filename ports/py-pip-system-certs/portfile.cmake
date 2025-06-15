vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pip-system-certs
    VERSION         ${VERSION}
    SHA512          81a3c35f5cdf310c6c24aab6c136b6c28fa6c068176acbeb848c24e8e1ee03580af52a68ca35c59958ac27eb905108a9784ec7bdd261c155e6c7d0b5e9873476
    FILENAME        pip_system_certs
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "pip_system_certs")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
