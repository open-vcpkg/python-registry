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

  # lxml's setupinfo.py hardcodes 'zlib' as a Windows link library, but the
  # current microsoft/vcpkg zlib port (madler/zlib cmake build) installs the
  # Windows import lib as `z.lib` (dynamic) / `zs.lib` (static)
  find_library(ZLIB_RELEASE NAMES z zs zlib PATHS "${CURRENT_INSTALLED_DIR}/lib" NO_DEFAULT_PATH REQUIRED)
  set(LXML_LIB_SHIM_DIR "${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-lib-shim")
  file(REMOVE_RECURSE "${LXML_LIB_SHIM_DIR}")
  file(MAKE_DIRECTORY "${LXML_LIB_SHIM_DIR}")
  configure_file("${ZLIB_RELEASE}" "${LXML_LIB_SHIM_DIR}/zlib.lib" COPYONLY)

  file(WRITE "${SOURCE_PATH}/setup.cfg" "
[build_ext]
include_dirs=${CURRENT_INSTALLED_DIR}/include;${CURRENT_INSTALLED_DIR}/include/libxml2
library_dirs=${LXML_LIB_SHIM_DIR};${CURRENT_INSTALLED_DIR}/lib
libraries=${LIBXML2_NAME}
")
endif()

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "lxml")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
