vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pyogrio
    VERSION         ${VERSION}
    SHA512          01d07745e8371ea8e9b4568d3ef9660aca4f3912a571e489712f47d8d7aee6e957ed2fef211810fabed24273e2114ef646dabfc104028df89e44d9116f4837ad
)

set(ENV{GDAL_INCLUDE_PATH} "${CURRENT_INSTALLED_DIR}/include")
set(ENV{GDAL_LIBRARY_PATH} "${CURRENT_INSTALLED_DIR}/lib")

set(PKGCONFIG "${CURRENT_HOST_INSTALLED_DIR}/tools/pkgconf/pkgconf${VCPKG_HOST_EXECUTABLE_SUFFIX}")
set(backup_PKG_CONFIG_PATH "$ENV{PKG_CONFIG_PATH}")
set(ENV{PKG_CONFIG_PATH} "${CURRENT_INSTALLED_DIR}/lib/pkgconfig${VCPKG_HOST_PATH_SEPARATOR}${CURRENT_PACKAGES_DIR}/lib/pkgconfig${VCPKG_HOST_PATH_SEPARATOR}${backup_PKG_CONFIG_PATH}")
execute_process(
                COMMAND "${PKGCONFIG}" "--modversion" "gdal"
                OUTPUT_VARIABLE GDAL_VERSION
                OUTPUT_STRIP_TRAILING_WHITESPACE
                COMMAND_ERROR_IS_FATAL ANY
            )
set(ENV{GDAL_VERSION} "${GDAL_VERSION}")
set(ENV{PKG_CONFIG_PATH} "${backup_PKG_CONFIG_PATH}")

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "pyogrio")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)