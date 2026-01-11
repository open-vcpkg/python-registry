vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    adbc-driver-sqlite
    VERSION         ${VERSION}
    SHA512          2698c50c86bcccf9353ab6ce23e7167a9b7e6b781b70c4b77c6348eb684d5ccf8d1d96906e4a29323475e2a415110a96116ba6e56442f44fafb3b1dd4c24f954
    FILENAME        adbc_driver_sqlite
)

set(ENV{ADBC_SQLITE_LIBRARY} "${CURRENT_INSTALLED_DIR}/lib/libadbc_driver_sqlite${VCPKG_TARGET_SHARED_LIBRARY_SUFFIX}")

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "adbc_driver_sqlite")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)