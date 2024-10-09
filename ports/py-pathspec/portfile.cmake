set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pathspec
    VERSION         ${VERSION}
    SHA512          19d1a8ae5936e76eacd691b0e2fb33d0de376556751a9ae007f6b09d0aa36af7d171101df620cab3e93c9913be578ff3d6bba9d4460351ac248e5c9e015380ad
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "pathspec")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
