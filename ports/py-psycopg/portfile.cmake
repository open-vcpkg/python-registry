vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    psycopg
    VERSION         ${VERSION}
    SHA512          5a597dee17f5476be47e61f1a934d8590c5e5b0b103ef385f077b37ff6387b7741992a241b9f638315e64cb04b75f6449a1fcf1fce741574df7d7841bea6e72e
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
