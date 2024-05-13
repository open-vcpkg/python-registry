vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    PyQt-builder
    FILE_NAME       pyqt_builder
    VERSION         ${VERSION}
    SHA512          64fc969799a12a176eb730fdc4581f18293dceb8edff20db0177ce409fe7e712cdfb07449b6c4abdd33f1fd9aabe8bee248fe9aeb5373df533d805f9d2a0c6a5
    PATCHES
      libpath.patch
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}" OPTIONS -x)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

# Shiver ... where do they come from
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/lib/${python_versioned}/site-packages/pyqtbuild/bundle/dlls/)

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
