vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    geographiclib
    VERSION         ${VERSION}
    SHA512          585f507cf7c3815645462affcc40c6babfa3179dfae695eeddf1a96de9315957679a00949d8c68f900c6da024a57cf1f6b90cbd843d8fdc668b6b43717d9ae5c
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "geographiclib")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
