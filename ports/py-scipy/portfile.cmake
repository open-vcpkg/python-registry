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

# Scipy depends on NumPy's command-line f2py utility, but
# the open-vcpkg py-numpy port doesn't install it. Here, we
# create it from scratch based on the one pip/PyPi installs.
# At present, it is a unix-like only solution.

# TODO: figure out how pip creates/installs this
if(NOT VCPKG_HOST_IS_WINDOWS)
  file(WRITE "${CURRENT_HOST_INSTALLED_DIR}/tools/tmp/f2py"
  "\
#!/bin/sh\n\
'''exec' ${PYTHON3} \"$0\" \"$@\"\n\
' '''\n\
import sys\n\
from numpy.f2py.f2py2e import main\n\
if __name__ == '__main__':\n\
    if sys.argv[0].endswith('.exe'):\n\
        sys.argv[0] = sys.argv[0][:-4]\n\
    sys.exit(main())\n\
\n\
"
  )
endif()

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    scipy
    VERSION         ${VERSION}
    SHA512          c2930d9be072057eb25394d6bee7fbe504f1b7c442b5393641ab3ff6bba590d4a76d240eb3a2ef58891bcb449af847de056a8957c591caa8fbf496ce9ce5a9e5
)

vcpkg_replace_string("${SOURCE_PATH}/meson.build" "py3.dependency()" "dependency('python-3.${PYTHON3_VERSION_MINOR}', method : 'pkg-config')")

vcpkg_mesonpy_prepare_build_options(OUTPUT meson_opts)

z_vcpkg_setup_pkgconfig_path(CONFIG "RELEASE")

list(APPEND meson_opts
  "--python.platlibdir" 
  "${CURRENT_INSTALLED_DIR}/${PYTHON3_SITE}"
)

# needed so pythran can be found
vcpkg_add_to_path("${CURRENT_HOST_INSTALLED_DIR}/bin")

# haven't been able to get this to build
# correctly on MacOS with lapack
if (VCPKG_TARGET_IS_OSX)
  list(APPEND meson_opts
    "-Dblas=accelerate"
  )
else()
  list(APPEND meson_opts
    "-Dblas=blas"
    "-Dlapack=lapack"
  )
endif()

file(COPY "${CURRENT_HOST_INSTALLED_DIR}/tools/tmp/f2py" DESTINATION ${CURRENT_HOST_INSTALLED_DIR}/tools/numpy/bin FILE_PERMISSIONS OWNER_EXECUTE OWNER_WRITE OWNER_READ GROUP_EXECUTE GROUP_READ)
file(REMOVE_RECURSE "${CURRENT_HOST_INSTALLED_DIR}/tools/tmp")
vcpkg_add_to_path("${CURRENT_HOST_INSTALLED_DIR}/tools/numpy/bin")

list(APPEND meson_opts  "--python.platlibdir" "${CURRENT_INSTALLED_DIR}/lib")
list(JOIN meson_opts "\",\""  meson_opts)

vcpkg_python_build_and_install_wheel(
  SOURCE_PATH "${SOURCE_PATH}"
  OPTIONS 
    --config-json "{\"setup-args\" : [\"${meson_opts}\" ] }"
)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/wheels") # don't need to keep the wheel

set(subdir "${CURRENT_PACKAGES_DIR}/${PYTHON3_SITE}/")
if(VCPKG_TARGET_IS_WINDOWS)
  set(subdir "${CURRENT_PACKAGES_DIR}/lib/site-packages/")
endif()
set(pyfile "${subdir}/scipy/__config__.py")
file(READ "${pyfile}" contents)
string(REPLACE "${CURRENT_INSTALLED_DIR}" "$(prefix)" contents "${contents}")
string(REPLACE "r\"${VCPKG_PYTHON3}\"" "sys.executable" contents "${contents}")
file(WRITE "${pyfile}" "${contents}")

file(GLOB licenses "${SOURCE_PATH}/LICENSE*")
vcpkg_install_copyright(FILE_LIST ${licenses})

vcpkg_python_test_import(MODULE "scipy")

# Add required Metadata for some python build plugins
file(WRITE "${CURRENT_PACKAGES_DIR}/${PYTHON3_SITE}/scipy-${VERSION}.dist-info/METADATA"
"Metadata-Version: 2.1\n\
Name: scipy\n\
Version: ${VERSION}"
)

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
