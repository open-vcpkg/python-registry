vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO  cython/cython
    REF ${VERSION}
    SHA512 78ac67edde9e8ef2d382cfd013f78d4a1b8f1a5e505dd13438245879f7b583328c127e40ef3c2a90277b7e6e5b00015aa9b85ceace1f7c6537761c783b26591c
    HEAD_REF main
)

# Disable optimizations to fix ARM64 build
if(MSVC)
  set(ENV{_LINK_} "/LTCG:OFF")
endif()

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

if(NOT VCPKG_TARGET_IS_WINDOWS)
  vcpkg_copy_tools(TOOL_NAMES cygdb cython cythonize DESTINATION "${CURRENT_PACKAGES_DIR}/tools/python3" AUTO_CLEAN)
endif()

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
set(VCPKG_POLICY_MISMATCHED_NUMBER_OF_BINARIES enabled)
