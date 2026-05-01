vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO pypa/flit
    REF ${VERSION}
    SHA512 1de9358fa33d0924355679ab6bccf5933f2f154257a875dfec7bf88bb569fce487129ff2d7ea13df16287acaedf9da49ce5f9baccd160ebfb6fd33e831e9c9cb
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
