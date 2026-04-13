vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    "scikit-learn"
    VERSION         ${VERSION}
    SHA512          956a1aececf0c219793653e2bb94a9a490f3edc87617dd8f1b16f9eeba53da874fb280fb9650cc8505a85d7c3a188aa72b8e675404519d57f666c44cbfc21ca4
    FILENAME        "scikit_learn"
)

vcpgk_install_python_build_dependencies(
    PACKAGES "scipy"
)

vcpkg_mesonpy_prepare_build_options(OUTPUT meson_opts)

z_vcpkg_setup_pkgconfig_path(CONFIG "RELEASE")

list(APPEND meson_opts  "--python.platlibdir" "${CURRENT_INSTALLED_DIR}/lib")
list(JOIN meson_opts "\",\""  meson_opts)

vcpkg_python_build_and_install_wheel(
  SOURCE_PATH "${SOURCE_PATH}"
  OPTIONS 
    --config-json "{\"setup-args\" : [ \"${meson_opts}\" ] }" 
)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/COPYING")
vcpkg_python_test_import(MODULE "sklearn")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)