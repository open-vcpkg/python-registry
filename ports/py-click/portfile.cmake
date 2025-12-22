vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    click
    VERSION         ${VERSION}
    SHA512          78bb5588f1f57f1ce00389bf3cd01630fb68bd75d4deaa9fa9cb6f420e571ea8216aefa37703154e4e99d141925c705a93212d6a23e8751a132a010f4379762e
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "click")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
