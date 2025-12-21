set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    jsonschema-specifications
    VERSION         ${VERSION}
    SHA512          04486de70d0fe5242d4a84006027499978983d7aacdb047711218510a5ffda41d5fa5da4acccb047b472e387ca580f6cb41221fb53207e931cb5bc5b9ad3a623
    FILENAME        jsonschema_specifications
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/COPYING")

vcpkg_python_test_import(MODULE "jsonschema_specifications")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
