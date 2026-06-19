vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO matplotlib/matplotlib
    REF v${VERSION}
    SHA512 160ebdcf335c8fb051405f61b05c613047e0164b93b1ff9ea6a8e23dc205af98e6459fab4f067ae3ea826572bc740e768111ecf40aaa28418860ac0861eed881
    HEAD_REF main
)

set(VCPKG_PYTHON3_BASEDIR "${CURRENT_HOST_INSTALLED_DIR}/tools/python3")
find_program(VCPKG_PYTHON3 NAMES python${PYTHON3_VERSION_MAJOR}.${PYTHON3_VERSION_MINOR} python${PYTHON3_VERSION_MAJOR} python PATHS "${VCPKG_PYTHON3_BASEDIR}" NO_DEFAULT_PATH)

set(ENV{PYTHON3} "${VCPKG_PYTHON3}")
set(PYTHON3 "${VCPKG_PYTHON3}")
set(z_vcpkg_python_func_python ${VCPKG_PYTHON3})

vcpkg_add_to_path(PREPEND "${VCPKG_PYTHON3_BASEDIR}")
if(VCPKG_TARGET_IS_WINDOWS)
  vcpkg_add_to_path(PREPEND "${VCPKG_PYTHON3_BASEDIR}/Scripts")
endif()

cmake_path(GET SCRIPT_MESON PARENT_PATH MESON_DIR)

vcpkg_mesonpy_prepare_build_options(
    OUTPUT meson_opts
    ${opts}
)

z_vcpkg_setup_pkgconfig_path(CONFIG "RELEASE")

list(APPEND meson_opts
  "--python.platlibdir" 
  "${CURRENT_INSTALLED_DIR}/${PYTHON3_SITE}"
)

list(JOIN meson_opts "\",\""  meson_opts)

vcpkg_python_build_and_install_wheel(
  SOURCE_PATH "${SOURCE_PATH}"
  OPTIONS 
    --config-json "{\"setup-args\" : [\"-Dsystem-freetype=true\", \"-Dsystem-qhull=true\", \"-Dsystem-libraqm=true\", \"${meson_opts}\" ] }"
)

file(GLOB licenses "${SOURCE_PATH}/LICENSE/*")

vcpkg_install_copyright(FILE_LIST ${licenses})
string(REPLACE "." ";" version_list "${VERSION}")
list(GET version_list 0 version_major)
list(GET version_list 1 version_minor)
list(GET version_list 2 version_patch)
file(WRITE "${CURRENT_PACKAGES_DIR}/${PYTHON3_SITE}/matplotlib/_version.py"
"\n\
TYPE_CHECKING = False\n\
if TYPE_CHECKING:\n\
    from typing import Tuple, Union\n\
    VERSION_TUPLE = Tuple[Union[int, str], ...]\n\
else:\n\
    VERSION_TUPLE = object\n\
\n\
version: str\n\
__version__: str\n\
__version_tuple__: VERSION_TUPLE\n\
version_tuple: VERSION_TUPLE\n\
\n\
__version__ = version = '${VERSION}'\n\
__version_tuple__ = version_tuple = (${version_major}, ${version_minor}, ${version_patch})\n\
\n\
")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

if(VCPKG_TARGET_IS_WINDOWS)
  # ft2font.pyd links freetype and libraqm (-> harfbuzz, fribidi) dynamically.
  # CPython loads .pyd modules with LOAD_WITH_ALTERED_SEARCH_PATH, which only
  # reliably resolves *direct* dependencies via os.add_dll_directory; the
  # transitive raqm -> harfbuzz/fribidi chain is not found on the vcpkg bin
  # dir. Co-locate the runtime DLLs next to the extension (as upstream
  # matplotlib wheels do via delvewheel) so the whole chain resolves.
  file(GLOB matplotlib_runtime_dlls
    "${CURRENT_INSTALLED_DIR}/bin/raqm*.dll"
    "${CURRENT_INSTALLED_DIR}/bin/harfbuzz*.dll"
    "${CURRENT_INSTALLED_DIR}/bin/fribidi*.dll"
    "${CURRENT_INSTALLED_DIR}/bin/freetype*.dll"
    "${CURRENT_INSTALLED_DIR}/bin/brotlicommon*.dll"
    "${CURRENT_INSTALLED_DIR}/bin/brotlidec*.dll"
    "${CURRENT_INSTALLED_DIR}/bin/bz2*.dll"
    "${CURRENT_INSTALLED_DIR}/bin/libpng*.dll"
    "${CURRENT_INSTALLED_DIR}/bin/zlib*.dll"
  )
  file(COPY ${matplotlib_runtime_dlls}
       DESTINATION "${CURRENT_PACKAGES_DIR}/${PYTHON3_SITE}/matplotlib")
  set(VCPKG_POLICY_MISMATCHED_NUMBER_OF_BINARIES enabled)
endif()

vcpkg_python_test_import(MODULE "matplotlib")
