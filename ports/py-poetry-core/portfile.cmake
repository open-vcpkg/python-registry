
vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    poetry-core
    VERSION         ${VERSION}
    SHA512          dd1d303abd034fc0341aaa5fc8d11f13ef305e93b9e9036f4040c2cb007c8b1eecbdb719d2b5692530b80ecc06d416751a45c499f373a05b7066e56785d1a8e8
    FILENAME        poetry_core
    FILENAME        poetry_core
    FILENAME        poetry_core
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "poetry.core")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
