vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    PyQt-builder
    FILENAME        pyqt_builder
    VERSION         ${VERSION}
    SHA512          a7b0717b0ff2b8f8cebec1ec6e4c63597153d7fdfd2e3cb2036c07e17b5eca28657010babd3d331874f9f5c1d130a0d75ff6a1255465bb381bc4d007a0316ef8
    FILENAME        pyqt_builder
    FILENAME        pyqt_builder
    FILENAME        pyqt_builder
    PATCHES
      libpath.patch
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

# Shiver ... where do they come from
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/lib/${python_versioned}/site-packages/pyqtbuild/bundle/dlls/)

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
