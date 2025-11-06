vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pydantic
    VERSION         ${VERSION}
    SHA512          50eb4ac28a9990a2005f82caf1d363dc9d3c19592d734228f6ade2556f252a6551f99c628d144df8b3aa18dc8054348dd0b8d77008c407f62ac85633dc2cf917
    FILENAME        pydantic
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
