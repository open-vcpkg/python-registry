vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    pyarrow
    VERSION         ${VERSION}
    SHA512          8a50f2472f95fa06c112118b09bf35995fdedcf7f2a475ac0f10e82aa57e7779d9b04d2bc474ee17747e8e93a95d4fde1a25ed5b85af99e278301936d8640b4d
)

set(ENV{Arrow_DIR} "${CURRENT_INSTALLED_DIR}/share/arrow")
set(ENV{ArrowCompute_DIR} "${CURRENT_INSTALLED_DIR}/share/arrowcompute")
set(ENV{Parquet_DIR} "${CURRENT_INSTALLED_DIR}/share/parquet")
set(ENV{ArrowDataset_DIR} "${CURRENT_INSTALLED_DIR}/share/arrowdataset")
set(ENV{ArrowAcero_DIR} "${CURRENT_INSTALLED_DIR}/share/arrowacero")
vcpkg_python_build_and_install_wheel(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        --config-json "{\"setup-args\" : [\"-DWITH_COMPUTE=ON\" ] }"
      )

# license is the same as dependency `arrow` -- but the pyarrow codebase
# is in a subdirectory of the arrow source repo, and the license is in
# the root directory and is therefore not included in the source directory
# for pyarrow
vcpkg_install_copyright(FILE_LIST "${CURRENT_INSTALLED_DIR}/share/arrow/copyright")
vcpkg_python_test_import(MODULE "pyarrow")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)