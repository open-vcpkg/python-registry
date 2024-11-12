vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    setuptools
    VERSION         ${VERSION}
    SHA512          8a25106010cda63b28d982f8258eed5dcebd027c1766fff6e3e6d1fec9422723d1da0acc78a05d3c2432edc7dfd8bbe28fdd87226d8ac47d32404ec4d9d1caaf
    PATCHES 
      fix-prefix.patch
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
#execute_process(COMMAND ${PYTHON3} "${SOURCE_PATH}/setup.py" install "--prefix=${CURRENT_INSTALLED_DIR}/tools/python3" "--root=${CURRENT_PACKAGES_DIR}"
#  COMMAND_ERROR_IS_FATAL ANY
#  WORKING_DIRECTORY  "${CURRENT_PACKAGES_DIR}/tools/python3"
#)
