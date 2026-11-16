vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    psycopg-c
    VERSION         ${VERSION}
    SHA512          f568254a939ec8596e89a194aef0fb046c502ebf461dcbe8b1c18e4dfc727ba99981bb508e03b2c3ac902bc27869b2f92c7a2f0f700cdb901cf87b24cedebe4b
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
