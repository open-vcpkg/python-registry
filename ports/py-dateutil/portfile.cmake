string(REGEX REPLACE "^py-" "" package "${PORT}")

# PYPI_PROJECT_NAME python-dateutil
vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    python-dateutil
    VERSION         ${VERSION}
    SHA512          40e87b7fe0a8281468da74a3e202cfdacfda7ba5ca692ac2282aed5de8daf7797daaa0a6801943fe68d7043a85991dbe43b092d6f1d7506853735b0a363f1a0d
    FILENAME        python_dateutil
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

string(REGEX REPLACE "-" "_" test_package "${package}")
vcpkg_python_test_import(MODULE "${test_package}")
