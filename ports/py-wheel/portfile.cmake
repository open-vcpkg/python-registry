vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO pypa/wheel
    REF ${VERSION}
    SHA512 8f92313cc26b55dd5d9720b95a7dce81493ac26f988c261c7eb2591bc0ac204df1c2ec5a58ab3c069bbdb59b13b27f807be29edec996c02d0b09e3ac2ad4aebc
    HEAD_REF main
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

if(NOT VCPKG_TARGET_IS_WINDOWS)
  vcpkg_copy_tools(TOOL_NAMES wheel DESTINATION "${CURRENT_PACKAGES_DIR}/tools/python3" AUTO_CLEAN)
endif()

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_python_test_import(MODULE "wheel")
