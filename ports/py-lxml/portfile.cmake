vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    lxml
    VERSION         ${VERSION}
    SHA512          1226453e909ba1d455a3f0e6ebb33cc5b7309ea678b423768ebc0a7ea9e6e4993d17acbed6945cc0c90f1f52f70e4968934812f7c5b6ceaf6d63bf32ca53bd33
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
