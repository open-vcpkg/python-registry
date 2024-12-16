vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    sip
    VERSION         ${VERSION}
    SHA512          a81e7e4c792af524bfb1aff3c3b8911903b7ca19f2378bfffe5bc1221110d657953ce4a7aa727de4bb4d2e318e2e8268591f5be7e0b53339d2e7441206850f9c
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
