vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    platformdirs
    VERSION         ${VERSION}
    SHA512          ad3c2dd1d65522be5b5cbd7e22447681ee0a9de80fd3716b64205c229995118ace7e9bd0282e98f9d83106df5d1332bcbebea97bc6433156de22d1e1ef2756f4
    FILENAME        platformdirs
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "platformdirs")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)