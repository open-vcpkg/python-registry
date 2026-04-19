set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
set(VCPKG_POLICY_MISMATCHED_NUMBER_OF_BINARIES enabled)
set(VCPKG_BUILD_TYPE release) # No debug builds required for pure python modules since vcpkg does not install a debug python executable. 

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    scipy
    VERSION         ${VERSION}
    SHA512          c2930d9be072057eb25394d6bee7fbe504f1b7c442b5393641ab3ff6bba590d4a76d240eb3a2ef58891bcb449af847de056a8957c591caa8fbf496ce9ce5a9e5
    PATCHES
      "no-fortran.patch"
      "interpolate.patch"
)

vcpkg_replace_string("${SOURCE_PATH}/meson.build" "py3.dependency()" "dependency('python-3.${PYTHON3_VERSION_MINOR}', method : 'pkg-config')")

vcpkg_install_python_build_dependency(
  PACKAGE "ply==3.11"
  HASHES
    "sha256:00c7c1aaa88358b9c765b6d3000c6eec0ba42abca5351b095321aef446081da3"
    "sha256:096f9b8350b65ebd2fd1346b12452efe5b9607f7482813ffca50c22722a807ce"
)
vcpkg_install_python_build_dependency(
  PACKAGE "gast==0.6.0"
  HASHES
    "sha256:52b182313f7330389f72b069ba00f174cfe2a06411099547288839c6cbafbd54"
    "sha256:88fc5300d32c7ac6ca7b515310862f71e6fdf2c029bbec7c66c0f5dd47b6b1fb"
)
vcpkg_install_python_build_dependency(
  PACKAGE "beniget==0.4.2.post1"
  HASHES
    "sha256:a0258537e65e7e14ec33a86802f865a667f949bb6c73646d55e42f7c45a052ae"
    "sha256:e1b336e7b5f2ae201e6cc21f533486669f1b9eccba018dcff5969cd52f1c20ba"
)
vcpkg_install_python_build_dependency(
  PACKAGE "pythran==0.18.1"
  HASHES
    "sha256:8803ed948bf841a11bbbb10472a8ff6ea24ebd70e67c3f77b77be3db900eccfe"
    "sha256:e1d811a5843d1881f8adcc3944fe3b84c7317ebf4530617829c19c9836f18b49"
)

vcpkg_mesonpy_prepare_build_options(OUTPUT meson_opts)

z_vcpkg_setup_pkgconfig_path(CONFIG "RELEASE")

list(APPEND meson_opts
  "--python.platlibdir" 
  "${CURRENT_INSTALLED_DIR}/${PYTHON3_SITE}"
)

# needed so pythran can be found
vcpkg_add_to_path("${CURRENT_HOST_INSTALLED_DIR}/bin")


if (VCPKG_TARGET_IS_OSX)
  list(APPEND meson_opts
    "-Dblas=accelerate"
    "-Dlapack=accelerate"
  )
else()
  list(APPEND meson_opts
    "-Dblas=blas"
    "-Dlapack=lapack"
  )
endif()

if (VCPKG_TARGET_IS_WINDOWS)
  list(APPEND meson_opts
    "-Duse-pythran=false"
  )
endif()

list(JOIN meson_opts "\",\""  meson_opts)

vcpkg_python_build_and_install_wheel(
  SOURCE_PATH "${SOURCE_PATH}"
  OPTIONS 
    --config-json "{\"setup-args\" : [\"${meson_opts}\" ] }"
)

set(subdir "${CURRENT_PACKAGES_DIR}/${PYTHON3_SITE}/")
set(pyfile "${subdir}/scipy/__config__.py")
file(READ "${pyfile}" contents)
if (VCPKG_TARGET_IS_WINDOWS)
  string(REPLACE "/" "\\" python_executable ${VCPKG_PYTHON3})
else()
  set(python_executable ${VCPKG_PYTHON3})
endif()
string(REPLACE "from enum import Enum" "from enum import Enum\nimport sys" contents "${contents}")
string(REPLACE "r\"${python_executable}\"" "sys.executable" contents "${contents}")
string(REPLACE "${CURRENT_INSTALLED_DIR}" "$(prefix)" contents "${contents}")
string(REGEX REPLACE "\"commands\": +r\"[A-Za-z0-9_ .:\\/-]+[/\\]([A-Za-z0-9_-]+)${VCPKG_HOST_EXECUTABLE_SUFFIX}\"" "\"commands\": r\"\\1${VCPKG_HOST_EXECUTABLE_SUFFIX}\"" contents "${contents}")
file(WRITE "${pyfile}" "${contents}")

file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/debug/include"
    "${CURRENT_PACKAGES_DIR}/debug/share"
)

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
