vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO python-pillow/Pillow
    REF ${VERSION}
    SHA512 eb031278da12ae0a19a974d6efbf3b87b2104585bee2fcfef5e94b434be2782253d03711317a816e66936a3fe22773d92a624d1b7274460ec11002f3a2941ab5
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
