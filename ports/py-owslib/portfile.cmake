vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    OWSLib
    VERSION         ${VERSION}
    SHA512          ddb6ff8efd9e7549ee3bde76f140a6cc818ddf4fb19fed6dccdee45996dfa6b6f9bb73f75789fdf9270024bd3d5f895711b545b0da9fa11621af4e739592e52c
    FILENAME        owslib
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "owslib")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
