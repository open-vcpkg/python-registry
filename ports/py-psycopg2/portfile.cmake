vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    psycopg2
    VERSION         ${VERSION}
    SHA512          0d37b51408298baad8b2b095af24b1c0d0b67ba99a2532ed7344a931c6f4d431be9c21c94811eace1b4418899f070f80e80266bfe0386aac2e64289ab1b8862e
    PATCHES
      env_configurable.patch
)

# Teach psycopg2's setup.py to read the libpq include/lib directories
# from environment variables instead of shelling out to `pg_config`.
# Mirrors the approach used by py-psycopg-c (see commit 1578c39e). This
# avoids depending on `tools/libpq/pg_config`, which may be absent on
# dynamic triplets where libpq is built via meson.
set(ENV{PSYCOPG2_PG_INCLUDEDIR} "${CURRENT_INSTALLED_DIR}/include")
set(ENV{PSYCOPG2_PG_LIBDIR} "${CURRENT_INSTALLED_DIR}/lib")

set(ENV{INCLUDE} "${CURRENT_INSTALLED_DIR}/include;$ENV{INCLUDE}")

vcpkg_python_build_and_install_wheel(
  SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
