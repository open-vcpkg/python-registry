set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    charset-normalizer
    VERSION         ${VERSION}
    SHA512          eb96d91b60b5ed083a6169a2c67534a6fd261d91e957f592a52076c98fad99d30e45a11754d51472e1b2815b08061005a5cf9a6844441726cd2814f22bdeef2c
    FILENAME        charset_normalizer
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "charset_normalizer")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
