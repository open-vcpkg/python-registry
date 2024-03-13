file(INSTALL
    "${CMAKE_CURRENT_LIST_DIR}/sitecustomize.py"
    DESTINATION "${CURRENT_PACKAGES_DIR}/tools/python3/Lib")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
