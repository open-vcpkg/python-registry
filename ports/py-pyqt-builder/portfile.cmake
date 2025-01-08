vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    PyQt-builder
    FILENAME        pyqt_builder
    VERSION         ${VERSION}
    SHA512          645655c2a51821a909c2799427ba5aab8b14b8324c3d797b34a38d372b27de29a13688fb8ac9ee9fb9160d194e044f9f3e89822f94e2160b6238076bceb8a5c7
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
