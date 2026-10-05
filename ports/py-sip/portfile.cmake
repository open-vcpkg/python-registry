vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    sip
    VERSION         ${VERSION}
    SHA512          d79c15661d8de65d85e2b81ec4ba45e080dd4590b4150f649fb646258bf81c337531c6f5e8cec9d5e5a9356ceff5fd7ab0499233e2f0911687f56049f62ae0f7
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
