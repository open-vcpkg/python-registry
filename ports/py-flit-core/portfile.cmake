vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO pypa/flit
    REF ${VERSION}
    SHA512 e31f86cb595f6749867da1173f56b9c2563fcb9c3c38cdbc637a511992e7b462f7627571aad3ef1da5cc6c6574448dc69cfeb9a37d3ed7a6ce5537e90dcb5fb9
    HEAD_REF main
)

set(PYTHON3_BASEDIR "${CURRENT_INSTALLED_DIR}/tools/python3")
find_program(PYTHON3 NAMES python${PYTHON3_VERSION_MAJOR}.${PYTHON3_VERSION_MINOR} python${PYTHON3_VERSION_MAJOR} python PATHS "${PYTHON3_BASEDIR}" NO_DEFAULT_PATH)

message(STATUS "Building dist with '${PYTHON3}'!")
execute_process(COMMAND "${PYTHON3}" "${SOURCE_PATH}/flit_core/build_dists.py"
  COMMAND_ERROR_IS_FATAL ANY
  #WORKING_DIRECTORY  "${wheeldir}"
)

file(GLOB wheel "${SOURCE_PATH}/flit_core/dist/*.whl")

file(MAKE_DIRECTORY ${CURRENT_PACKAGES_DIR}/${PYTHON3_SITE})
message(STATUS "Installing wheel!")
execute_process(COMMAND "${PYTHON3}" "${SOURCE_PATH}/flit_core/bootstrap_install.py" "${wheel}" -i "${CURRENT_PACKAGES_DIR}/${PYTHON3_SITE}"
  COMMAND_ERROR_IS_FATAL ANY
  #WORKING_DIRECTORY  "${wheeldir}"
)
message(STATUS "Finished installing wheel!")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
