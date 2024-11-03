vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    kerberos-proxy-auth
    VERSION         ${VERSION}
    SHA512          08082bb0b72feb5963842257fef26875bd6ab5104bbbc20e6503e3c013eb19a774fb0fcdb04f5def52c69696814f973b1ccbbe0209715bd8b951dd54ec8b0a36
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "kerberos_proxy_auth")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
