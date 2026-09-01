vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    psycopg-c
    VERSION         ${VERSION}
    SHA512          a9533320703c68643ac0f48e63561f569fddf6a2a58b7ef24b3c915b0704d1eefa69507eb00b445c72a71d2653baec4a8ccb19ab75bab1eb5b03610cb7c08add
    FILENAME        psycopg_c
    PATCHES
      env_configurable.patch
)

set(ENV{PSYCOPG_PG_INCLUDEDIR} "${CURRENT_INSTALLED_DIR}/include")
set(ENV{PSYCOPG_PG_LIBDIR} "${CURRENT_INSTALLED_DIR}/lib")

vcpkg_python_build_and_install_wheel(
  SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
