vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO projg2/gpep517
    REF v${VERSION}
    SHA512 421a681e7de79ea06fb89920dbe1e2ba58f5dcb8ecd1bb4043dea5415978621b817c212b001a64d3955a1f7b8156b6a845e2b4c64130ebefc155de20701dcbc9
    HEAD_REF main
)

file(COPY "${SOURCE_PATH}/gpep517" DESTINATION "${CURRENT_PACKAGES_DIR}/${PYTHON3_SITE}")
# TODO: python3 -m compileall "$pkgdir/$sitedir"

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/COPYING")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
