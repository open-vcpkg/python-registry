set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    MarkupSafe
    VERSION         ${VERSION}
    SHA512          032a791bdc82ddb8cb7a24ee767ae87bd996af2a7195c9272bff7affc0bb63ffe664f54c785335d917b2fa23f45c74fd3b41e51ed46c0eef7a44f005070311f1
    FILENAME        markupsafe
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

vcpkg_python_test_import(MODULE "markupsafe")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
