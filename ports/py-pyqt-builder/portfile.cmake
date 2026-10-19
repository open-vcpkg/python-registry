vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    PyQt-builder
    VERSION         ${VERSION}
    SHA512          685eb52843dfcdeb394345a99770989ec9a8d3755c25a8eef56f04ef18e86dff006afe2a90c2e5d15b383b0dda0df5a64c0efa6f64d24c214dfe09430108a504
    FILENAME        pyqt_builder
    PATCHES
      libpath.patch
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

# Shiver ... where do they come from
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/lib/${python_versioned}/site-packages/pyqtbuild/bundle/dlls/)

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
