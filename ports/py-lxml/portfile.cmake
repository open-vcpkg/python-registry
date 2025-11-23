vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    lxml
    VERSION         ${VERSION}
    SHA512          2aaa37a4504cd23d2022cbe7c2d99173aa0e3d6ec82a95e2429369ef3ef787db185440b8581db975cb81287c3ab533dd2e7cb447cefe0d7e628082f51c5b5254
)

if(VCPKG_TARGET_IS_WINDOWS)
  file(WRITE "${SOURCE_PATH}/setup.cfg" "
[build_ext]
include_dirs=${CURRENT_INSTALLED_DIR}/include;${CURRENT_INSTALLED_DIR}/include/libxml2
library_dirs=${CURRENT_INSTALLED_DIR}/lib
libraries=libxml2
")
endif()

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "lxml")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
