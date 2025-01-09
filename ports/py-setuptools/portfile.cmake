vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    setuptools
    VERSION         ${VERSION}
    SHA512          4afa657c5259f9f405c39d82d8c264236749861ba2b104e8b26dd49da8ffb27ad3089ea894f2bb65208f480d7a4042114b93228f1cf2b224dc248774d7681a3d
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
