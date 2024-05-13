file(INSTALL
    "${CMAKE_CURRENT_LIST_DIR}/sitecustomize.py"
    DESTINATION "${CURRENT_PACKAGES_DIR}/tools/python3/Lib")

vcpkg_install_copyright(FILE_LIST "${VCPKG_ROOT_DIR}/LICENSE.txt")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
