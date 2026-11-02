set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
set(VCPKG_POLICY_MISMATCHED_NUMBER_OF_BINARIES enabled)
set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    duckdb
    VERSION         ${VERSION}
    SHA512          a48595608b027d4984afe2650b574fda09d48fc91031356abdaed0e027ea1696744dded818c33e0d566e0a4d0f28f80bbefbb7734cc89b1070d5919a0fd6e659
)

z_vcpkg_make_prepare_flags()
z_vcpkg_make_set_common_vars()
foreach(buildtype IN LISTS buildtypes)
    string(TOUPPER "${buildtype}" cmake_buildtype)
    z_vcpkg_make_prepare_env("${cmake_buildtype}" ${prepare_env_opts})
endforeach()

set(ENV{CMAKE_PREFIX_PATH} "${CURRENT_INSTALLED_DIR}")
vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "duckdb")
