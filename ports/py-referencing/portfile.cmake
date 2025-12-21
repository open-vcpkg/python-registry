set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    referencing
    VERSION         ${VERSION}
    SHA512          8882ac50849e66da6829772bb6140fbd4c853c7fd7410bedd61b29afe071d3c631382f624f203b446887a86cb0885fbdb946092c2d2ecc1907433fd2ef7cb426
    FILENAME        referencing
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/COPYING")

vcpkg_python_test_import(MODULE "referencing")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
