vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    adbc-driver-sqlite
    VERSION         ${VERSION}
    SHA512          57ab3e845d88c82f328867a36658f6362fe5c095d6b173cbcdc9094593984095bb9f077fe79ccdc22fcfd0afd19bc2ff33196ed47a111ba20f8731eb3781f963
    FILENAME        adbc_driver_sqlite
)

set(ENV{ADBC_SQLITE_LIBRARY} "${CURRENT_INSTALLED_DIR}/lib/libadbc_driver_sqlite${VCPKG_TARGET_SHARED_LIBRARY_SUFFIX}")

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "adbc_driver_sqlite")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)