set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    contourpy
    VERSION         ${VERSION}
    SHA512          3664481b9a78d5d97c69c3ab6cb106798766af1eca9763310f9fa144d6e9574f98d0786158b2963c8490402c4ec3acb284371acbe84d9e33185157ea1260f675
)

# py-meson installs mesonpy without its dist-info, so importlib.metadata can't find meson-python
vcpkg_replace_string("${SOURCE_PATH}/lib/contourpy/util/meson.build"
    [[import importlib.metadata as im; print(im.version("meson-python"))]]
    [[import mesonpy; print(mesonpy.__version__)]]
)

set(VCPKG_PYTHON3_BASEDIR "${CURRENT_HOST_INSTALLED_DIR}/tools/python3")
find_program(VCPKG_PYTHON3 NAMES python${PYTHON3_VERSION_MAJOR}.${PYTHON3_VERSION_MINOR} python${PYTHON3_VERSION_MAJOR} python PATHS "${VCPKG_PYTHON3_BASEDIR}" NO_DEFAULT_PATH)

set(ENV{PYTHON3} "${VCPKG_PYTHON3}")
set(PYTHON3 "${VCPKG_PYTHON3}")
set(z_vcpkg_python_func_python ${VCPKG_PYTHON3})

vcpkg_mesonpy_prepare_build_options(OUTPUT meson_opts)

z_vcpkg_setup_pkgconfig_path(CONFIG "RELEASE")

list(APPEND meson_opts
  "--python.platlibdir"
  "${CURRENT_INSTALLED_DIR}/${PYTHON3_SITE}"
)

list(JOIN meson_opts "\",\""  meson_opts)

vcpkg_python_build_and_install_wheel(
  SOURCE_PATH "${SOURCE_PATH}"
  OPTIONS
    --config-json "{\"setup-args\" : [\"${meson_opts}\" ] }"
)

vcpkg_install_copyright(FILE_LIST "${CURRENT_PORT_DIR}/copyright")

vcpkg_python_test_import(MODULE "contourpy")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
