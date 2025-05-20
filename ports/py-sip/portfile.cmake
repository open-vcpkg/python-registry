vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    sip
    VERSION         ${VERSION}
    SHA512          499339424eccb27309ca2d220cf57c29b484faed45849ea2ab7772a69841b617ab01a8261e70869e7071f4871bc7211a7bb421cc2ff30d0fcf46f28e4c41f323
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

# Shiver ... where do they come from
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/lib/${python_versioned}/site-packages/pyqtbuild/bundle/dlls/)

if(NOT VCPKG_TARGET_IS_WINDOWS)
  vcpkg_fixup_shebang(SCRIPT "sip-build" MODULE "sipbuild.tools.build")
  vcpkg_fixup_shebang(SCRIPT "sip-distinfo" MODULE "sipbuild.tools.distinfo")
  vcpkg_fixup_shebang(SCRIPT "sip-install" MODULE "sipbuild.tools.install")
  vcpkg_fixup_shebang(SCRIPT "sip-module" MODULE "sipbuild.tools.module")
  vcpkg_fixup_shebang(SCRIPT "sip-sdist" MODULE "sipbuild.tools.sdist")
  vcpkg_fixup_shebang(SCRIPT "sip-wheel" MODULE "sipbuild.tools.wheel")
endif()


set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
