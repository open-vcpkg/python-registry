vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO mesonbuild/meson-python
    REF ${VERSION}
    SHA512 a51b23d86226a4cde82a0ab835a218ecf7594b242b0996d1f0562d39669c6b2a2d070548584678498a027506724026dda09847baef9b6abb0d7d1c0646d086d9
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
