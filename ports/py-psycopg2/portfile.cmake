vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    psycopg2
    VERSION         ${VERSION}
    SHA512          7aebcf55161b1ad60af4b64fef64f676cdf68ee1597c8c1107350c367f1eafafe37b736716d191e3a3ba4d4ea6d436d22cb606f44655b4aebc8613d4314dbc15
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
