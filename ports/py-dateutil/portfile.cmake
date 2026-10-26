string(REGEX REPLACE "^py-" "" package "${PORT}")

# PYPI_PROJECT_NAME python-dateutil
vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    python-dateutil
    VERSION         ${VERSION}
    SHA512          638dcea7a840163bfd79d174b3ccd43254d712b92c1739dc93f937ecce122994ff25d19a579705cd6ba77336901e879ab4c7f68ca599b5576656a3b6783c2c69
    FILENAME        python_dateutil
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

string(REGEX REPLACE "-" "_" test_package "${package}")
vcpkg_python_test_import(MODULE "${test_package}")
