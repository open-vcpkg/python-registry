vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    lxml
    VERSION         ${VERSION}
    SHA512          972956629ce8fca885fd2261e7d46d0954f851ab14557de2706cec8a68ac7f612052b0c9ec64477aecc9284d769bf3958d688c58beea876f311acc0c6d59ab8a
)

if(VCPKG_TARGET_IS_WINDOWS)
  # vcpkg's libxml2 may be installed as libxml2.lib (shared) or libxml2s.lib (static)
  # depending on the triplet. Resolve the actual name.
  find_library(LIBXML2_LIB NAMES libxml2 libxml2s xml2 PATHS "${CURRENT_INSTALLED_DIR}/lib" NO_DEFAULT_PATH REQUIRED)
  get_filename_component(LIBXML2_NAME "${LIBXML2_LIB}" NAME_WE)
  file(WRITE "${SOURCE_PATH}/setup.cfg" "
[build_ext]
include_dirs=${CURRENT_INSTALLED_DIR}/include;${CURRENT_INSTALLED_DIR}/include/libxml2
library_dirs=${CURRENT_INSTALLED_DIR}/lib
libraries=${LIBXML2_NAME}
")
endif()

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "lxml")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
