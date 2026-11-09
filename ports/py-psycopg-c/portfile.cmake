vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    psycopg-c
    VERSION         ${VERSION}
    SHA512          76e72d1bd364a2d42ee1094e65721b9a4ec94b39a28aa86d66b03b6493569d23285186d053924221a80572b3c891322c50c516ecfed6c43fcc32b1be9096e17d
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
