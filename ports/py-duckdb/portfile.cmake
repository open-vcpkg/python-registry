set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
set(VCPKG_POLICY_MISMATCHED_NUMBER_OF_BINARIES enabled)
set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    duckdb
    VERSION         ${VERSION}
    SHA512          b6c4afe279754b77d26f298fe67766c229ae4498f0ea26226b26f073d7ae6837bb39a3c7b3b3710dbfd77cd09e22dcead2eb85ded7ca90db802d6d01fd159225
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
