vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    PyYAML
    VERSION         ${VERSION}
    SHA512          4fc671c8e952cc5d5bb08c3123bdeca035417c30a3bdb5b8f945d6bd48029d50ddaa48d8ff1d87307a461fc706ffe0cccc048093b65c9398fd2f5ffefee9b708
    FILENAME        pyyaml
)

# Build the libyaml bindings (yaml.CLoader, yaml.CDumper). Without Cython or libyaml,
# setup.py quietly falls back to pure Python; these make that an error instead.
# py-cython is a target dependency too: setup.py imports it in the target python, which in a cross build
# can't load the host's compiled Cython.
set(ENV{PYYAML_FORCE_CYTHON} 1)
set(ENV{PYYAML_FORCE_LIBYAML} 1)
file(APPEND "${SOURCE_PATH}/setup.cfg" "
[build_ext]
include_dirs=${CURRENT_INSTALLED_DIR}/include
library_dirs=${CURRENT_INSTALLED_DIR}/lib
")
if(VCPKG_TARGET_IS_WINDOWS AND VCPKG_LIBRARY_LINKAGE STREQUAL "static")
    file(APPEND "${SOURCE_PATH}/setup.cfg" "define=YAML_DECLARE_STATIC\n")
endif()

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "yaml._yaml")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
