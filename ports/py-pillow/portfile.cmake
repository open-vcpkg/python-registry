vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO python-pillow/Pillow
    REF ${VERSION}
    SHA512 41453e23021fdb08ed9bf8b67a912f8217010840f99665e49465088e76c608fca78c2ca4dda3de8728ba9f8002c7e98231135669990d88758c5944afa0a13f64
    HEAD_REF master
)

set(ENV{PKG_CONFIG} "${CURRENT_HOST_INSTALLED_DIR}/tools/pkgconf/pkgconf")
set(ENV{PKG_CONFIG_PATH} "${CURRENT_INSTALLED_DIR}/lib/pkgconfig")
if(VCPKG_TARGET_IS_WINDOWS)
  set(ENV{INCLUDE} "${CURRENT_INSTALLED_DIR}/include;$ENV{INCLUDE}")
  set(ENV{INCLIB} "${CURRENT_INSTALLED_DIR}/lib;$ENV{INCLIB}")
  set(ENV{LIB} "${CURRENT_INSTALLED_DIR}/lib;$ENV{LIB}")
endif()

vcpkg_python_build_and_install_wheel(
  SOURCE_PATH "${SOURCE_PATH}" 
  OPTIONS 
    --config-json "{\"raqm\": \"disable\", \"xcb\": \"disable\"}"
    #-C raqm=disable # linkage issues. Without pc file missing linkage to harfbuzz fribidi
)



vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_python_test_import(MODULE "PIL")
