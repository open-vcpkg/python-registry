set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    hatchling
    VERSION         ${VERSION}
    SHA512          d3b93b3c2d6c8928f8f6029e0b8e9cbd4fb341dbfc699ed0b333d50b09768a9163a57106bf1941db1a975407b569c21d15d4d357345326a78651e7282aa9fd50
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

vcpkg_python_test_import(MODULE "hatchling")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
