vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    sip
    VERSION         ${VERSION}
    SHA512          8d828aa1c71cdd2b7e7e379d2d2298641ec17afee5ef1e2022ea58f27d02754351aae321eba9c5cfe70c1f821a8212f66a46a7486d15746b581e0816bbda54c7
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

# Shiver ... where do they come from
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/lib/${python_versioned}/site-packages/pyqtbuild/bundle/dlls/)

vcpkg_fixup_shebang(SCRIPT "sip-build" MODULE "sipbuild.tools.build")
vcpkg_fixup_shebang(SCRIPT "sip-distinfo" MODULE "sipbuild.tools.distinfo")
vcpkg_fixup_shebang(SCRIPT "sip-install" MODULE "sipbuild.tools.install")
vcpkg_fixup_shebang(SCRIPT "sip-module" MODULE "sipbuild.tools.module")
vcpkg_fixup_shebang(SCRIPT "sip-sdist" MODULE "sipbuild.tools.sdist")
vcpkg_fixup_shebang(SCRIPT "sip-wheel" MODULE "sipbuild.tools.wheel")


set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
