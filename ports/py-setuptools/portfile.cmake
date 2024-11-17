vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    setuptools
    VERSION         ${VERSION}
    SHA512          353ad99bb946d5ed07139f3a6d5f0efc9a4ca9721b060fce9095ee6fc74ac0e832fd0ebf7b2d1d68c71021db30561c5fea6abdde42174981f26002390a1e0e67
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
