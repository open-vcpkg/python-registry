vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    sip
    VERSION         ${VERSION}
    SHA512          bcb6a04e18c68d103ee25eaf45358ce1e681474d4ec8e6d715332cce170feddd93eee8948e6e3871a7efaa120e6a07c36e45f6841c68057f4a0fc8b0ddb27048
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
