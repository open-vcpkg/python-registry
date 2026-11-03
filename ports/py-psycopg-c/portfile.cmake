vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    psycopg-c
    VERSION         ${VERSION}
    SHA512          6c7985cd1e7d3a323e9c0fc2efd9cde77a3e5fd273cae8497e39b2f69b248bf7c04227ad0d86a3c682caa974762d6688e5b411f13a91398c58efb8dfd8f96432
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
