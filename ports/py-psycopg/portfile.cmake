vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    psycopg
    VERSION         ${VERSION}
    SHA512          a16117183516a270b5735a0c897172c2a3203c26ca5bbc36b6b7215dfb2e786246b5109e794faad71415ae060b11d2963f71a7704325f763ad51884276076825
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
