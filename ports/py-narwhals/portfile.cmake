set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    narwhals
    VERSION         ${VERSION}
    SHA512          cb48b03e2540aa04e55cbf4a8862b7d0d3376b4aab81f0b7c252097d1774188f2699a1e45f1fa7ad57f6f2a16d9b83569f7ea7f6238e159e537e68e531bed2a5
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.md")

vcpkg_python_test_import(MODULE "narwhals")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
