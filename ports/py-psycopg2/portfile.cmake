vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    psycopg2
    VERSION         ${VERSION}
    SHA512          0d37b51408298baad8b2b095af24b1c0d0b67ba99a2532ed7344a931c6f4d431be9c21c94811eace1b4418899f070f80e80266bfe0386aac2e64289ab1b8862e
)

# psycopg2's setup.py invokes `pg_config` by literal name and ignores the
# PG_CONFIG environment variable, so we must expose a working `pg_config`
# on PATH that returns vcpkg-relative paths.
#
# Since libpq switched to meson (microsoft/vcpkg#51250), `pg_config` is no
# longer placed in the standard `bin/` directory but under
# `tools/libpq/pg_config`, and on some platforms the binary itself may not
# be directly usable from outside its install tree. Instead of relying on
# it, drop a tiny stub on PATH that answers the only two queries psycopg2
# actually needs (`--includedir` and `--libdir`) using CURRENT_INSTALLED_DIR.
# Mirrors the stub used by py-psycopg-c.
set(PG_CONFIG_STUB_DIR "${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-pg-config-stub")
file(REMOVE_RECURSE "${PG_CONFIG_STUB_DIR}")
file(MAKE_DIRECTORY "${PG_CONFIG_STUB_DIR}")

if(VCPKG_TARGET_IS_WINDOWS)
    set(PG_CONFIG_STUB "${PG_CONFIG_STUB_DIR}/pg_config.bat")
    file(WRITE "${PG_CONFIG_STUB}"
"@echo off\r\n\
if /I \"%~1\"==\"--includedir\" ( echo ${CURRENT_INSTALLED_DIR}/include & exit /b 0 )\r\n\
if /I \"%~1\"==\"--libdir\" ( echo ${CURRENT_INSTALLED_DIR}/lib & exit /b 0 )\r\n\
\"${CURRENT_INSTALLED_DIR}/tools/libpq/pg_config.exe\" %*\r\n"
    )
else()
    set(PG_CONFIG_STUB "${PG_CONFIG_STUB_DIR}/pg_config")
    file(WRITE "${PG_CONFIG_STUB}"
"#!/bin/sh
case \"$1\" in
    --includedir) echo \"${CURRENT_INSTALLED_DIR}/include\" ;;
    --libdir)     echo \"${CURRENT_INSTALLED_DIR}/lib\" ;;
    *)            exec \"${CURRENT_INSTALLED_DIR}/tools/libpq/pg_config\" \"$@\" ;;
esac
"
    )
    execute_process(COMMAND chmod +x "${PG_CONFIG_STUB}")
endif()

vcpkg_add_to_path(PREPEND "${PG_CONFIG_STUB_DIR}")

set(ENV{INCLUDE} "${CURRENT_INSTALLED_DIR}/include;$ENV{INCLUDE}")

vcpkg_python_build_and_install_wheel(
  SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
