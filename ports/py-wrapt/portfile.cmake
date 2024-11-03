set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    wrapt
    VERSION         ${VERSION}
    SHA512          27b2547a016c4a6bfdecfb860e26f3b4cd5af64eda0c0865393baf8a6e2ebe31cc2e8a74f0ba02a453854962c4a24ade84e0cb983f011e7b10a3a6c291f794cc
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "wrapt")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
