set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pysfcgal
    VERSION         ${VERSION}
    SHA512          78998df1083a0c657008eee55ebe39cb0841ef7d783996cee0eee0dbee83d607cf467ba7a3edbc92eb1c60480ec1942ba2fded5f301664b6d0169b6624d9cb62
    FILENAME        pysfcgal
)

set(ENV{INCLUDE_PATH} "${CURRENT_INSTALLED_DIR}/include")
set(ENV{LIBPATH}      "${CURRENT_INSTALLED_DIR}/lib")

vcpkg_python_build_and_install_wheel(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.md")

vcpkg_python_test_import(MODULE "pysfcgal")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
