set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    wrapt
    VERSION         ${VERSION}
    SHA512          26ad70de5662329abca8b0d05652ca5a0585f58c0a9808afe96222a81bc54bef11ec841d64993364f4fcc9719c99a96c19ea77134b146c5cb7ee8a9044359444
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "wrapt")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
