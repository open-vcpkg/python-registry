vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    psycopg
    VERSION         ${VERSION}
    SHA512          983282bf5692a8059896bbf9666648eddf8febb12560e3a17e16fa923ffdd18f99a913a96cbc3066c42224592f4bb2b240c4ee86b7f6a3daf60ab6f618e9a4c0
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
