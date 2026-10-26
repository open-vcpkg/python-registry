vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    adbc-driver-sqlite
    VERSION         ${VERSION}
    SHA512          9aaadae435f543d15bf90632d7a69be675d3bad06effaa178309ce8cf9899fd48777ea224415d2d7c3ac800f4bcd83ff044bbd12a2801e9be46150f7dbfe888c
    FILENAME        adbc_driver_sqlite
)

set(ENV{ADBC_SQLITE_LIBRARY} "${CURRENT_INSTALLED_DIR}/lib/libadbc_driver_sqlite${VCPKG_TARGET_SHARED_LIBRARY_SUFFIX}")

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "adbc_driver_sqlite")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)