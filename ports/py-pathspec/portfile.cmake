set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pathspec
    VERSION         ${VERSION}
    SHA512          e115d3828085b3fc268a14e3362f067ae38ce8317340b6e32841f05d0480cc41970dfe4ac90b05a524fa408220f40911e430ac0a468c469bd366e8a0e39e7bb6
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "pathspec")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
