vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    sip
    VERSION         ${VERSION}
    SHA512          d8bc5dc574b0b02c72227f188d3cff64785e794cce5941101269332de3359c2ed50ef1f002e70004050aa477c66803affe2e9a26b12c652722dc774c5fd64ee3
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
