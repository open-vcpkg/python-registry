vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    isort
    VERSION         ${VERSION}
    SHA512          80f48e82de1bfe99282de42d594adc4128d7cbdc9fa36bb5e333e5c28f46290d394ba56ec5899187ef734f33725b4ce30c988f1baf66150b92a144c563982062
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "isort")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
