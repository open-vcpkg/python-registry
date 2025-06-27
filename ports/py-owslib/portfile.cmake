vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    OWSLib
    VERSION         ${VERSION}
    SHA512          02471d70acc6a2015440235d4f48d2a58ff44073694d48b218d35dbe8781e7c3c16597cba00c1c19c109302a359fb2dd6beee70f65c4e48b42fe8e81820718bc
    FILENAME        owslib
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "owslib")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
