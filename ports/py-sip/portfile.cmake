vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    sip
    VERSION         ${VERSION}
    SHA512          80e0ee5cab2b8898037c2ff6ef272c87252c506315912917da8567e7d50b5c0ffb2e156e78ab4f1775a915af746b51c0486f4d10e15214367077660101cba8b6
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
