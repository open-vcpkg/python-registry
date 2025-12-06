vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    PyQt-builder
    VERSION         ${VERSION}
    SHA512          2308c51f93c37b1d13f312e4f2475d26b22d374ef284925fead9eab4aa89b994770431aca45170ac2154b4813fff151798f113f56d4cbf6c6e544fb463104a6d
    FILENAME        pyqt_builder
    PATCHES
      libpath.patch
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

# Shiver ... where do they come from
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/lib/${python_versioned}/site-packages/pyqtbuild/bundle/dlls/)

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
