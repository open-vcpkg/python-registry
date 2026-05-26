vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    psycopg-c
    VERSION         ${VERSION}
    SHA512          ab3299f090dc594a2036398fee10a9b63548b7de62dbcbd4041b806a105212b62a7aff7b7a6003a1bf041bc4846ea8a9e2c25e432234059f26c55e603190d608
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
