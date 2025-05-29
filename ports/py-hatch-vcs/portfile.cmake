set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    hatch-vcs
    VERSION         ${VERSION}
    SHA512          75731f61b325ab757a681dfc4b28d78f998961b4f96ae0070209a7a1ac96a28e27beecedef41aed08e9538f4136dcac29a3cc5aa254af2d2ded921d7afb28951
    FILENAME        hatch_vcs
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

vcpkg_python_test_import(MODULE "hatch_vcs")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
