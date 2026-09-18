vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO projg2/gpep517
    REF v${VERSION}
    SHA512 f61deb134d4b39a56f6782884b87383fbe864ce0c6c7c2b53c0fe0a17019637f8d37b9c420194ba0cc6ac40dd09bd5b3518a4cabb61331a9da5c53fb2d18c660
    HEAD_REF main
)

file(COPY "${SOURCE_PATH}/gpep517" DESTINATION "${CURRENT_PACKAGES_DIR}/${PYTHON3_SITE}")
# TODO: python3 -m compileall "$pkgdir/$sitedir"

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/COPYING")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
