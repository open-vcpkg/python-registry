set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    ephem
    VERSION         ${VERSION}
    SHA512          06bd6235389bb8d660529f636dc1a1a0e366dc1d5a6cd93e5dfc523ebd01d0fb3ca3c963ad801dba0de8022378ff76fd48e82bac62a7686772f6ae12ddffb3aa
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
vcpkg_python_test_import(MODULE "ephem")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
