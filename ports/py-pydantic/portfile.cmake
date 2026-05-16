vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pydantic
    VERSION         ${VERSION}
    SHA512          c1cd883a44e3664cccf5f8c7a10cfd8d27748af0dc50cbc0bf76d2c591d3b19dd247d8b12ab2f494fd144e80e5a4aeaf94632ef6577c5bee2aadaacd07915249
    FILENAME        pydantic
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
