vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO pypa/wheel
    REF ${VERSION}
    SHA512 c07fa4a4e9efa28680f5ee7601058d71d9de3f005771eb452029a3866d0734a5a341d51b73f90f94773e9bb39a1438755aa1f9a34a24929c253047b7f7e65708
    HEAD_REF main
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

if(NOT VCPKG_TARGET_IS_WINDOWS)
  vcpkg_copy_tools(TOOL_NAMES wheel DESTINATION "${CURRENT_PACKAGES_DIR}/tools/python3" AUTO_CLEAN)
endif()

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_python_test_import(MODULE "wheel")
