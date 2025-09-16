set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    cffi
    VERSION         ${VERSION}
    SHA512          a8bf705e626f6b5858cc20e9044a23fd653d155e2a2d4cb59f1eed00ef13ebd92d5a2f07738c66b361cb24d863786d4379dcd9c176250b546fbd45758e51d4f4
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "cffi")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
