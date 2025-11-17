set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    shapely
    VERSION         ${VERSION}
    SHA512          f1a9e0a5156dc37ad894eb41fea9a1426e1fcc8cd40b2d3af94dbbe2f65c49f134fc1ad3d4a8b7bdad6a4d04af4c2a24443d37c6ed114c70ef67149ed9067e19
    FILENAME        shapely
)

set(ENV{GEOS_INCLUDE_PATH} "${CURRENT_INSTALLED_DIR}/include")
set(ENV{GEOS_LIBRARY_PATH} "${CURRENT_INSTALLED_DIR}/lib")

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

vcpkg_python_test_import(MODULE "shapely")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
