set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    urllib3
    VERSION         ${VERSION}
    SHA512          b825663ed9e037763c3c8a049f818330ee9cf0d00ba6f3bd368114ed1feb750e0e6613920cde62443aa05aa84752a2cdfa4f7a6f631801031cb2fbf6736675e3
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

vcpkg_python_test_import(MODULE "urllib3")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
