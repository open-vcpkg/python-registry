vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO mesonbuild/meson-python
    REF ${VERSION}
    SHA512 1e785db5332af6dfa598fcb29910f6b216d3ec71971866a94a4c2001b2dfa95a32218496c5409d9aeb68f35d34e816e7b39ec1b6ec05a853115ee294a6fcc3fc
    HEAD_REF main
)

set(VCPKG_BUILD_TYPE release)

vcpkg_configure_meson(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_install_meson()

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

if(VCPKG_TARGET_IS_WINDOWS)
    file(MAKE_DIRECTORY "${CURRENT_PACKAGES_DIR}/tools/python3/Lib")
    file(RENAME "${CURRENT_PACKAGES_DIR}/Lib/site-packages/" "${CURRENT_PACKAGES_DIR}/${PYTHON3_SITE}/")
    file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/Lib")
endif()

vcpkg_python_test_import(MODULE "mesonpy")

configure_file("${CMAKE_CURRENT_LIST_DIR}/vcpkg-port-config.cmake" "${CURRENT_PACKAGES_DIR}/share/${PORT}/vcpkg-port-config.cmake" @ONLY)
file(COPY "${CMAKE_CURRENT_LIST_DIR}/vcpkg_mesonpy_prepare_build_options.cmake"
          DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
