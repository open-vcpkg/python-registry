vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME        pydantic
    VERSION         ${VERSION}
    SHA512          6ff5b0953d383518cadfab4cc1d84395e100c76e70da8c7d861b89eee308dca29021393e24dabe0f278b09886cc64015b354a42a35ba5873287830f7533160f1
    FILENAME        pydantic
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
