vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    sip
    VERSION         ${VERSION}
    SHA512          464d71ffe76dc170b863a6a6faf16df8b0e8c363063bcd32b784d8a1055dd9558f41975c7b17cfcb3e7b383a812f22d6542fe0228193cc4cc7c8b745f3843b1d
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
