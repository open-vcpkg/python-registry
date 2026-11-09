set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    mypy-extensions
    VERSION         ${VERSION}
    SHA512          f050995fc3de1da951a21d9a1abad70a2d42bdfa4577ce76dcb24e2b272a8708dc0e23aa1311e500e72660a787206774ad8ada4f62aa571867ba8b945fe8bfed
    FILENAME        mypy_extensions
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "mypy_extensions")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
