vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    adbc-driver-sqlite
    VERSION         ${VERSION}
    SHA512          0ef723f98a0563c837af6cbd3f13a0750e4c51badd89f52f40d7282e75f6807f98a14072a2a1ee7f7e74394d8728be3e70c00c25d1e73ffb6289531ae1baa532
    FILENAME        adbc_driver_sqlite
)

set(ENV{ADBC_SQLITE_LIBRARY} "${CURRENT_INSTALLED_DIR}/lib/libadbc_driver_sqlite${VCPKG_TARGET_SHARED_LIBRARY_SUFFIX}")

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "adbc_driver_sqlite")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)