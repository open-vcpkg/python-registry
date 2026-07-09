vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO scikit-build/scikit-build-core
    REF v${VERSION}
    SHA512 37271b1caa33b99359207cc7f627e9296132c90ad8caa87c6544c8586d0457c81ad6f5b2c3e0cfd672e954b644b29ac110b209e05fcef01f082f92b1ca0f89bc
    HEAD_REF main
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

#file(COPY "${SOURCE_PATH}/llama_cpp" DESTINATION "${CURRENT_PACKAGES_DIR}/tools/python3/Lib/site-packages")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "scikit_build_core")
