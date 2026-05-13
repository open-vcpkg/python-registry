set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    requests
    VERSION         ${VERSION}
    SHA512          4e3b5c40489b682225667cf46e36058bc22dce6b580e3d01962ea7fa46517e15a775458ebeb970b53fb2f87048f3f09bf09ac599b66c36827622fea7c17e83b6
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "requests")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
