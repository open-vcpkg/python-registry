vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    adbc-driver-postgresql
    VERSION         ${VERSION}
    SHA512          fee2da86a6f9a31b22b41c1d57a1eac5d261336d30c48a80497a4fb63b8150508f3b752d00bf135de51b339e708981c9dc3b9f7b0229b1cab59603e4e478ad9e
    FILENAME        adbc_driver_postgresql
)

set(ENV{ADBC_POSTGRESQL_LIBRARY} "${CURRENT_INSTALLED_DIR}/lib/libadbc_driver_postgresql${VCPKG_TARGET_SHARED_LIBRARY_SUFFIX}")

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "adbc_driver_postgresql")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)