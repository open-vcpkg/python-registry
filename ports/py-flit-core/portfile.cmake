vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO pypa/flit
    REF ${VERSION}
    SHA512 10086861c59047fad5b02b39b527f3e805bf93ea21d66879ce67743ab04fca4021b491963d89590821806c3747baccdc697f953a27ef50f0608eb0519f8a6909
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
