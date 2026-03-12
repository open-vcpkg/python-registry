vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO duckdb/duckdb
        REF v${VERSION}
        SHA512 c7fabf6e4e0ccf3d1f9bc750c23def714ebe460e82e8c0e06ac157f50c245224807fd717751de65fb51e6203db4e30adb5c7500fb4524696d96d1efab34fb395
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
