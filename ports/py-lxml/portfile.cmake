vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    lxml
    VERSION         ${VERSION}
    SHA512          3d0bf222d5f213366a8b17d48702d3a5b430355d71b9ac88b4b1980e1a53fe34ba1d02c62053550f60f0320778647635d1af92c682b7f57ebf266521e9ee0d92
)

if(VCPKG_TARGET_IS_WINDOWS)
  set(ENV{INCLUDE} "${CURRENT_INSTALLED_DIR}/include;$ENV{INCLUDE}")
endif()

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
vcpkg_python_test_import(MODULE "lxml")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
