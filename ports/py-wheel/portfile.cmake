vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO pypa/wheel
    REF ${VERSION}
    SHA512 2eb1b9d8f24b9f7221d24a49b54352f001df778172828d7d58626fd5b5463109cef7fbbdc48548c128b8cdf99a4b76a833f4092d758239375ede7285dfa7c701
    HEAD_REF main
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

if(NOT VCPKG_TARGET_IS_WINDOWS)
  vcpkg_copy_tools(TOOL_NAMES wheel DESTINATION "${CURRENT_PACKAGES_DIR}/tools/python3" AUTO_CLEAN)
endif()

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_python_test_import(MODULE "wheel")
