set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    hatchling
    VERSION         ${VERSION}
    SHA512          08d56be0641f8c009ecf32eafc7659158c6b2b67709b22e8cecf5dd1d7edd2307bf4a1d79af51064fdfde7017b6972df32f545f90f48f74410b02c7ca8aae993
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

vcpkg_python_test_import(MODULE "hatchling")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
