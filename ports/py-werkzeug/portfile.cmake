vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    werkzeug
    VERSION         ${VERSION}
    SHA512          500f47e13546a3d0ce3a41f21157649571ea70b332ca22758bad939cb42aee4d1b58b64cecc4ed83a857ad466f37de8256cf7b53ad28e5fe0fd353455df3639b
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "werkzeug")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
