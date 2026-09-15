vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    lxml
    VERSION         ${VERSION}
    SHA512          9cebd4f0a6218bbfaa618704e6694f4a1558d64d96067ba1e2aa7604513248934dffbc45b622d2ac4bdc790034adfd59b029ec8b5396d49b9d903b960f215014
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
else()
  # On Linux/macOS lxml's setup detects libxml2/libxslt via pkg-config. Point it
  # at vcpkg's installed .pc files (libxml-2.0.pc, libxslt.pc, libexslt.pc) so it
  # builds against the vcpkg-provided libraries instead of relying on system
  # development packages (which are not present in clean CI images).
  set(ENV{PKG_CONFIG_PATH} "${CURRENT_INSTALLED_DIR}/lib/pkgconfig:$ENV{PKG_CONFIG_PATH}")
endif()

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "lxml")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
