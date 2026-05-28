vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO  cython/cython
    REF ${VERSION}
    SHA512 19e487f9993ffd286cc679993c4fa9904628bc336c5c032a05a91c64fb8e1d20c7d463b26476c0659bd737fbccf6383793f2d3f7af92388066ef2d82a9e175bc
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
