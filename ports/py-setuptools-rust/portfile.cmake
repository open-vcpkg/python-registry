vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    setuptools_rust
    VERSION         ${VERSION}
    SHA512          6a89447d1642c46595df9922a2ded209bebd69639195b2ead85946ededc661a2b76fef5be43b6fbf0e184850df8483703142ed4306b392a4ccf2ff7e53dc624a
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "setuptools_rust")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
