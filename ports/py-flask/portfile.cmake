vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    Flask
    VERSION         ${VERSION}
    SHA512          dd1d9113f57d62cd8fb5d33a6fb6258761a39c3df41d174e52f454abfbfc2da4b6a88b142196bd0681637fe53982d95762b023acddbed00f10805c4266194e24
    FILENAME        flask
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "flask")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
