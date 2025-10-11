vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    psycopg2
    VERSION         ${VERSION}
    SHA512          44f7b03d958dc62822be8a8c38d738c4016c3a1f860c824158b78ba0a23f04ca63377171b22a14e38b76df868458ede25f29e4643197912adb2f1a1db8c0d5c0
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

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
