vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    "scikit-learn"
    VERSION         ${VERSION}
    SHA512          956a1aececf0c219793653e2bb94a9a490f3edc87617dd8f1b16f9eeba53da874fb280fb9650cc8505a85d7c3a188aa72b8e675404519d57f666c44cbfc21ca4
    FILENAME        "scikit_learn"
)

set(VCPKG_PYTHON3_BASEDIR "${CURRENT_HOST_INSTALLED_DIR}/tools/python3")
find_program(VCPKG_PYTHON3 NAMES python${PYTHON3_VERSION_MAJOR}.${PYTHON3_VERSION_MINOR} python${PYTHON3_VERSION_MAJOR} python PATHS "${VCPKG_PYTHON3_BASEDIR}" NO_DEFAULT_PATH)
find_program(VCPKG_CYTHON NAMES cython PATHS "${VCPKG_PYTHON3_BASEDIR}" "${VCPKG_PYTHON3_BASEDIR}/Scripts" NO_DEFAULT_PATH)

set(ENV{PYTHON3} "${VCPKG_PYTHON3}")
set(PYTHON3 "${VCPKG_PYTHON3}")

vcpkg_add_to_path(PREPEND "${VCPKG_PYTHON3_BASEDIR}")
if(VCPKG_TARGET_IS_WINDOWS)
  vcpkg_add_to_path(PREPEND "${VCPKG_PYTHON3_BASEDIR}/Scripts")
endif()

cmake_path(GET VCPKG_CYTHON PARENT_PATH CYTHON_DIR)
vcpkg_add_to_path("${CYTHON_DIR}")

set(z_vcpkg_python_func_python ${PYTHON3})
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