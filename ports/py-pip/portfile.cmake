vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pip
    VERSION         ${VERSION}
    SHA512          82278769f49df3f1c0f60c8cceda25e879f0792cec91d55a252c697169688e0114628f2a18b7dcf266804c8645224fc42409b0d0f18625fa5d78d9603533bdcf
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
