set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    urllib3
    VERSION         ${VERSION}
    SHA512          663c83a78908dac9bb05c7ac833183c2fdc2969d0662d21dd8751ba13c51880ee264f7804760f33ebdabfd1c1f04a5d44171a420396de6ae582f9789801b141c
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

vcpkg_python_test_import(MODULE "urllib3")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
