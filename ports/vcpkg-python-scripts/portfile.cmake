file(INSTALL
    "${CMAKE_CURRENT_LIST_DIR}/vcpkg_python_functions.cmake"
    "${CMAKE_CURRENT_LIST_DIR}/vcpkg-port-config.cmake"
    "${CMAKE_CURRENT_LIST_DIR}/import_test.py.in"
    DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")

set(packages
    "flit-core"
    "gpep517"
    "wheel"
    "packaging"
    "setuptools"
    "pyproject-metadata"
    "pyproject-hooks"
)

set(scripts
    "pip"
    "pip3"
    "pip${PYTHON3_VERSION_MAJOR}.${PYTHON3_VERSION_MINOR}"
    "gpep517"
    "wheel"
    "activate"
    "activate.csh"
    "activate.fish"
)

if ("setuptools-scm" IN_LIST FEATURES)
  list(APPEND packages "setuptools-scm")
  list(APPEND scripts "setuptools-scm" "vcs-versioning" )
endif()

if ("meson" IN_LIST FEATURES)
    list(APPEND packages 
        "meson" 
        "meson-python"
    )
    list(APPEND scripts "meson")
endif()

if ("hatchling" IN_LIST FEATURES)
    list(APPEND packages 
        "hatchling"
        "hatch-vcs"
        "hatch-fancy-pypi-readme"
    )
    list(APPEND scripts "hatchling" "hatch-fancy-pypi-readme" "trove-classifiers")
endif()

if ("maturin" IN_LIST FEATURES)
    list(APPEND packages "maturin")
endif()

if ("cython" IN_LIST FEATURES)
    list(APPEND packages "cython")
    list(APPEND scripts "cython" "cydbg" "cythonize")
endif()

if ("poetry" IN_LIST FEATURES)
    list(APPEND packages "poetry-core")
    list(APPEND scripts "poetry")
endif()

if ("scikit-build" IN_LIST FEATURES)
    list(APPEND packages "scikit-build-core")
endif()

if ("numpy" IN_LIST FEATURES)
    list(APPEND packages "numpy")
    list(APPEND scripts "numpy-config" "f2py")
endif()

if ("versioneer" IN_LIST FEATURES)
    list(APPEND packages "versioneer")
    list(APPEND scripts "versioneer")
endif()

if ("pybind11" IN_LIST FEATURES)
    list(APPEND packages "pybind11")
    list(APPEND scripts "pybind11-config")
endif()

# ensure that PYTHON3 variable set in vcpkg-tool-meson doesn't interfere with finding the installed python
unset(PYTHON3)
unset(CACHE{PYTHON3})

set(PYTHON3_BASEDIR "${CURRENT_INSTALLED_DIR}/tools/python3")
find_program(PYTHON3 NAMES python${PYTHON3_VERSION_MAJOR}.${PYTHON3_VERSION_MINOR} python${PYTHON3_VERSION_MAJOR} python PATHS "${PYTHON3_BASEDIR}" NO_DEFAULT_PATH)

# create and install virtual build environment
x_vcpkg_get_python_packages(
        PYTHON_EXECUTABLE "${PYTHON3}"
        PACKAGES ${packages}
        OUT_PYTHON_VAR PYTHON3_VENV
    )

cmake_path(GET PYTHON3_VENV PARENT_PATH PYTHON3_VENV_BIN)
cmake_path(GET PYTHON3_VENV_BIN PARENT_PATH PYTHON3_VENV_ROOT)
set(PYTHON3_BUILD_VENV "${CURRENT_PACKAGES_DIR}/tools/build_venv")
file(REMOVE_RECURSE ${PYTHON3_BUILD_VENV})
file(MAKE_DIRECTORY ${PYTHON3_BUILD_VENV})
file(COPY "${PYTHON3_VENV_ROOT}/" DESTINATION ${PYTHON3_BUILD_VENV})
file(REMOVE_RECURSE ${PYTHON3_VENV_ROOT})

# fixup pkgconfig files installed into python site-packages
file(GLOB_RECURSE pkgconfigs "${PYTHON3_BUILD_VENV}/${PYTHON3_SITE}/**/*.pc")
if (pkgconfigs)
    file(MAKE_DIRECTORY "${CURRENT_PACKAGES_DIR}/share/pkgconfig")
    foreach(_pc_file IN LISTS pkgconfigs)
        file(INSTALL "${_pc_file}" DESTINATION "${CURRENT_PACKAGES_DIR}/share/pkgconfig")
    endforeach()
    foreach(_pc_file IN LISTS pkgconfigs)
        get_filename_component(_pc_dir "${_pc_file}" DIRECTORY)
        file(REMOVE_RECURSE "${_pc_dir}")
    endforeach()
    vcpkg_fixup_pkgconfig()
endif()

# move include files from python site-packages to includes folder
file(GLOB_RECURSE
    include_dirs
    LIST_DIRECTORIES true
    ${PYTHON3_BUILD_VENV}/${PYTHON3_SITE}/**/include
)
list(FILTER include_dirs INCLUDE REGEX "^${PYTHON3_BUILD_VENV}/${PYTHON3_SITE}/.*/include$")
foreach(include_dir IN LISTS include_dirs)
    file(INSTALL "${include_dir}/" DESTINATION "${CURRENT_PACKAGES_DIR}/include")
endforeach()

# fixup absolute paths
file(READ "${PYTHON3_BUILD_VENV}/pyvenv.cfg" contents)
string(REPLACE ${PYTHON3_BASEDIR} "\$\{prefix\}" contents "${contents}")
string(REPLACE ${PYTHON3_VENV_ROOT} ".." contents "${contents}")
file(WRITE "${PYTHON3_BUILD_VENV}/pyvenv.cfg" "${contents}")

foreach(script IN LISTS scripts)
    set(script_path "${PYTHON3_BUILD_VENV}/bin/${script}${VCPKG_HOST_EXECUTABLE_SUFFIX}")
    if(EXISTS "${script_path}")
        file(READ "${script_path}" contents)
        string(REPLACE "#!${PYTHON3_VENV_ROOT}/bin/python" "#!/usr/bin/env python" contents "${contents}")
        string(REPLACE ${PYTHON3_VENV_ROOT} ".." contents "${contents}")
        file(WRITE "${script_path}" "${contents}")
    endif()
endforeach()

# remove .venv/include/python3.12 if empty
file(GLOB includes "${PYTHON3_BUILD_VENV}/include/python${PYTHON3_VERSION_MAJOR}.${PYTHON3_VERSION_MINOR}/*")
if (NOT includes)
    file(REMOVE_RECURSE "${PYTHON3_BUILD_VENV}/include")
endif()

file(INSTALL "${VCPKG_ROOT_DIR}/LICENSE.txt" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)