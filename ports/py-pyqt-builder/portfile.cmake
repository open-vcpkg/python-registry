vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    PyQt-builder
    FILENAME        pyqt_builder
    VERSION         ${VERSION}
    SHA512          9af2a977854b6a1f6cf7c3c31b18c4104e8cb46cf9066700a62151ed5dfe7d82645065b747dc68a3588e855a96c40102e0e47a972ab752f751825e6fd4c91332
    FILENAME        pyqt_builder
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
