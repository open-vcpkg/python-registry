set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    shapely
    VERSION         ${VERSION}
    SHA512          d227333086b5495c0188da178da7c256055260f54b45aff158c5addd3957406e88a5607dea816ee5afd7f466b97f0ab2043c1454f4df214d7c64a770966fa9d6
    FILENAME        shapely
)

set(VCPKG_PYTHON3_BASEDIR "${CURRENT_HOST_INSTALLED_DIR}/tools/python3")
find_program(VCPKG_PYTHON3 NAMES python${PYTHON3_VERSION_MAJOR}.${PYTHON3_VERSION_MINOR} python${PYTHON3_VERSION_MAJOR} python PATHS "${VCPKG_PYTHON3_BASEDIR}" NO_DEFAULT_PATH)

set(ENV{PYTHON3} "${VCPKG_PYTHON3}")
set(PYTHON3 "${VCPKG_PYTHON3}")
set(z_vcpkg_python_func_python ${VCPKG_PYTHON3})

# cython is installed next to the host python
vcpkg_add_to_path(PREPEND "${VCPKG_PYTHON3_BASEDIR}")
if(VCPKG_TARGET_IS_WINDOWS)
  vcpkg_add_to_path(PREPEND "${VCPKG_PYTHON3_BASEDIR}/Scripts")
endif()

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

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")

vcpkg_python_test_import(MODULE "shapely")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
