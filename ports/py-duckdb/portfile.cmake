set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
set(VCPKG_POLICY_MISMATCHED_NUMBER_OF_BINARIES enabled)
set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    duckdb
    VERSION         ${VERSION}
    SHA512          9d03fda570ad288c1cf8f6c68656b018af7ae895f8841b576ee6e0efac27e7b309779d5e1e79b7dedc66e5a5d9b6b1a52068fbf0a53769a81390a5d25f1c2b7e
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
