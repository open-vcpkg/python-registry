vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME        sip
    VERSION         ${VERSION}
    SHA512          c884c58fc51708e2dd247453f2214e6b01d7e1a9a0166b4228feb5d996310ace2665238dde26af34907e596a0a1c710fc130ae79297f430f73f639a3eb781a50
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
