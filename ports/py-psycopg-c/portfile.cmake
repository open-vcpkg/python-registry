vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    psycopg-c
    VERSION         ${VERSION}
    SHA512          8a7109b22ee939789a57b46cf8c76252aae21fbe63b2139fc87798280c51544063aeeb9ff84a77ed37ccad3a44e3180b9596f5361c7b069c9d5171927f64e299
    FILENAME        psycopg_c
)

if(VCPKG_TARGET_IS_WINDOWS)
  vcpkg_add_to_path("${CURRENT_INSTALLED_DIR}/tools/libpq") 
else()
  vcpkg_add_to_path("${CURRENT_INSTALLED_DIR}/tools/libpq/bin") 
endif()

set(ENV{INCLUDE} "${CURRENT_INSTALLED_DIR}/include;$ENV{INCLUDE}")

vcpkg_python_build_and_install_wheel(
  SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
