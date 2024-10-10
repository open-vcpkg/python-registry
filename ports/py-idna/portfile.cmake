set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    idna
    VERSION         ${VERSION}
    SHA512          bdc00fb42c48a34ec3df91b0592fe41785061f891a252ce82f168d99089a52e8e5bc7a823794f61e7915c0f691d911ed8b3bf7aecf3e2aeb3fc85da4ef35f47e
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.md")

vcpkg_python_test_import(MODULE "idna")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
