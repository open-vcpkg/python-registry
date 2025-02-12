vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    lxml
    VERSION         ${VERSION}
    SHA512          7bd8828d94d0d5e453877962cf9c332e38d4db289d6d962decabeca7ee8c73a9bfa8c9f315f5ee2e224f0b80022d718fb0e20ab62664c4471bd41611f16da18c
)

if(VCPKG_TARGET_IS_WINDOWS)
  set(ENV{INCLUDE} "${CURRENT_INSTALLED_DIR}/include;$ENV{INCLUDE}")
endif()

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "lxml")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
