vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO projg2/gpep517
    REF v${VERSION}
    SHA512 463c3812f388ea7ef83aaf6b3b90de4036b0a8200038a654621822c02d46627f7adf2ed4c7accf016293f89b8c3a2080d9ac80d2f82caaa3fdd370aa98c4335b
    HEAD_REF main
)

file(COPY "${SOURCE_PATH}/gpep517" DESTINATION "${CURRENT_PACKAGES_DIR}/${PYTHON3_SITE}")
# TODO: python3 -m compileall "$pkgdir/$sitedir"

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/COPYING")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
