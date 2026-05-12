set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    urllib3
    VERSION         ${VERSION}
    SHA512          6f75e5873f18301de37c0d7f17c726b21c9928f2fe9ec58d843f1172b80be6eb05117bdf7af27dd7eb1ab0175a94e0f49cde01d8d8919f61de8710e163fabc03
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

vcpkg_python_test_import(MODULE "urllib3")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
