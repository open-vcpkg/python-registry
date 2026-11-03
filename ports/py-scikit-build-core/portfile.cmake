vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO scikit-build/scikit-build-core
    REF v${VERSION}
    SHA512 dc8f8081279f9d7dcd4675d5f402c04f9c029ab666a16032f04039c38c15afcf909e7670d18b0f85a0ae284c806e5e3ef0e7b63fb49d34870795a98f155ed000
    HEAD_REF main
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

#file(COPY "${SOURCE_PATH}/llama_cpp" DESTINATION "${CURRENT_PACKAGES_DIR}/tools/python3/Lib/site-packages")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "scikit_build_core")
