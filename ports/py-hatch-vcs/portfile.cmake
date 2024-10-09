set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    hatch_vcs
    VERSION         ${VERSION}
    SHA512          8689d3939b384b66c8153b88e82c55c4ec59a971dae6138c8d70995d332d62c870d611f0be5d2e47640f6c80cb55d1d8e556d6b3f0085f94dd505aaf7fdb93bd
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

vcpkg_python_test_import(MODULE "hatch_vcs")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
