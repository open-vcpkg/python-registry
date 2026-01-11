vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    adbc-driver-postgresql
    VERSION         ${VERSION}
    SHA512          85d4649de259e72c6d516556efdcd14685f5788d7aa84b556e154f749b08f19ff0ee3f9b51488b6345491fd6830abff4d187c4840ccf696fa2b5f69a078c3045
    FILENAME        adbc_driver_postgresql
)

set(ENV{ADBC_POSTGRESQL_LIBRARY} "${CURRENT_INSTALLED_DIR}/lib/libadbc_driver_postgresql${VCPKG_TARGET_SHARED_LIBRARY_SUFFIX}")

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "adbc_driver_postgresql")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)