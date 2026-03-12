vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO python-pillow/Pillow
    REF ${VERSION}
    SHA512 791c8972d913b616bd903aa4e9a468b1886faf5a477414fdd07cd37a29253f3e158988adf613969ea3f3efcef716d74b8d667efbac0d85ba12c15da2137c32a3
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
