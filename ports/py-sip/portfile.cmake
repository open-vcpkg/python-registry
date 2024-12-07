vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    sip
    VERSION         ${VERSION}
    SHA512          1bcd097936e5f1762588df9146467216d069000c0bbfef93fc7fc49d4775fa8917332d31391165b80e204c59109ec09be14bbd143598b12c8f77eb7c5d086195
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

# Shiver ... where do they come from
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/lib/${python_versioned}/site-packages/pyqtbuild/bundle/dlls/)

if(NOT VCPKG_TARGET_IS_WINDOWS)
  vcpkg_fixup_shebang(SCRIPT "bin/sip-build")
  vcpkg_fixup_shebang(SCRIPT "bin/sip-distinfo")
  vcpkg_fixup_shebang(SCRIPT "bin/sip-install")
  vcpkg_fixup_shebang(SCRIPT "bin/sip-module")
  vcpkg_fixup_shebang(SCRIPT "bin/sip-sdist")
  vcpkg_fixup_shebang(SCRIPT "bin/sip-wheel")
endif()


set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
