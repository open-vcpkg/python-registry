vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    adbc-driver-postgresql
    VERSION         ${VERSION}
    SHA512          b63fc3dec732669d7937f27671d37c8a7823459dd588adb077a8e1b61bcba5830c2213bf32ec5f90ac0ed9624e14c123f585da45ff08cd38ca3bd5056fcbb779
    FILENAME        adbc_driver_postgresql
)

set(ENV{ADBC_POSTGRESQL_LIBRARY} "${CURRENT_INSTALLED_DIR}/lib/libadbc_driver_postgresql${VCPKG_TARGET_SHARED_LIBRARY_SUFFIX}")

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "adbc_driver_postgresql")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)