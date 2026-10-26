vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    adbc-driver-postgresql
    VERSION         ${VERSION}
    SHA512          b315e61b5c36f04ed2bc8d2d1e731a2f52dab40d57f4daebfd09a46efde21d7245ee1850d7287caa19784a8ed55dda727c2c7d8fb716f5811bccb3525daabe2f
    FILENAME        adbc_driver_postgresql
)

set(ENV{ADBC_POSTGRESQL_LIBRARY} "${CURRENT_INSTALLED_DIR}/lib/libadbc_driver_postgresql${VCPKG_TARGET_SHARED_LIBRARY_SUFFIX}")

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "adbc_driver_postgresql")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)