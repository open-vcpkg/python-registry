vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    PyYAML
    VERSION         ${VERSION}
    SHA512          0df64497f51bd07ee01d7676afc4cf3eff228e1a73d4b1c7f034c7cba762f3451aa686e594af54e8e359173262cc0e47c110491bc7e29c3dd712a66c4316b2cf
    FILENAME        pyyaml
)

# Build the libyaml bindings (yaml.CLoader, yaml.CDumper). Without Cython or libyaml,
# setup.py quietly falls back to pure Python; these make that an error instead.
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
