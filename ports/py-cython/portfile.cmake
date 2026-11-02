vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO  cython/cython
    REF ${VERSION}
    SHA512 d7f766b42bae70bd6d78c808c4f900dbb15fca854751f2ece8a03011819e3fc7eb033dfd6744c88fa62f64a18cefcb1d3d5854581850bfaf332804e66549d94e
    HEAD_REF main
)

# MSVC's link-time code generation hangs on ARM64 (Cython.Runtime.refnanny with MSVC 14.51)
if(VCPKG_TARGET_IS_WINDOWS AND VCPKG_TARGET_ARCHITECTURE STREQUAL "arm64")
  set(ENV{_CL_} "/GL-")
  set(ENV{_LINK_} "/LTCG:OFF")
endif()

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

if(NOT VCPKG_TARGET_IS_WINDOWS)
  vcpkg_copy_tools(TOOL_NAMES cygdb cython cythonize DESTINATION "${CURRENT_PACKAGES_DIR}/tools/python3" AUTO_CLEAN)
endif()

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
set(VCPKG_POLICY_MISMATCHED_NUMBER_OF_BINARIES enabled)
