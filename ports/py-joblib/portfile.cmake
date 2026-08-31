vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    joblib
    VERSION         ${VERSION}
    SHA512          9b5a92ed5403a586dea4b54d051cfd0f15af2e74acae6783301cf8c50762190b37e873b892c3514686d8f070d5b98048065f0b9ce37dcb521644915f952cee5f
    FILENAME        joblib
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "joblib")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)