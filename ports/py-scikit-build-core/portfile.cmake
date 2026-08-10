vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO scikit-build/scikit-build-core
    REF v${VERSION}
    SHA512 f5fb61a9d6fb91d59eb225344736104d18ec18ff93c5a6cdbb1861d7e07fd982cc760222d79e745c3ba8e98046c4165abc24a27d89b43bd450aab2c42bf75926
    HEAD_REF main
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

#file(COPY "${SOURCE_PATH}/llama_cpp" DESTINATION "${CURRENT_PACKAGES_DIR}/tools/python3/Lib/site-packages")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "scikit_build_core")
