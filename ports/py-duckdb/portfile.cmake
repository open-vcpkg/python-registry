vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO duckdb/duckdb
        REF v${VERSION}
        SHA512 d9b4cdc798212ddeb518d9c1d8a6640423ac05f9e8ce99855f96c63778a6757079da37fed17ad8ec131b3f28a9f89c3580d2bbacad03d7607d9d9150347f4903
        HEAD_REF main
)

z_vcpkg_make_prepare_flags()
z_vcpkg_make_set_common_vars()
foreach(buildtype IN LISTS buildtypes)
    string(TOUPPER "${buildtype}" cmake_buildtype)
    z_vcpkg_make_prepare_env("${cmake_buildtype}" ${prepare_env_opts})
endforeach()

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}/tools/pythonpkg")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "duckdb")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
