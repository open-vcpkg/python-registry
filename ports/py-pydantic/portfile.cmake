vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pydantic
    VERSION         ${VERSION}
    SHA512          54ee1a49d5a429cad31928425c197139ae3cce004d8f3530835ce39897be9afa6aea35e639af1d6290bace7148e1369ce66840e26bced329bc2e7d93b3dad6e5
    FILENAME        pydantic
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
