set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    hatchling
    VERSION         ${VERSION}
    SHA512          71c88077c9b85f6bf9acd40c0c981552fe58a0e12e0d51bd46b2de5ac9665927a651233fef804f66cc3abd88a1ec5dec6e97e2f4653674e2337b40da1ace4495
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

vcpkg_python_test_import(MODULE "hatchling")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
