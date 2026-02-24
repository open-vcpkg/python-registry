vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO mesonbuild/meson-python
    REF ${VERSION}
    SHA512 f3943b8b00eee962da5c734419d2793dca19bab962a2247369287b46f80203bc24eaa394ace93e988bf2f91808b6201d574907bd7070ab2e4c3f4f5df972e639
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
