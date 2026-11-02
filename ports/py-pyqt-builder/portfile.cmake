vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    PyQt-builder
    VERSION         ${VERSION}
    SHA512          d6a2fa5dce1390e86660bfe56d84aa89611f019e561e3cf0cc604e168bf16ee5a2c0abf9c47ccc65d32e3ded0a3ad7b1e21a6e5ded7bc0fec8608ce81f9c4e96
    FILENAME        pyqt_builder
    PATCHES
      libpath.patch
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

# Shiver ... where do they come from
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/lib/${python_versioned}/site-packages/pyqtbuild/bundle/dlls/)

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
