vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO scikit-build/scikit-build-core
    REF v${VERSION}
    SHA512 6dc9cc2bdc6e621973c73b5de7daebd34bae12e5e45957c39e6de3173c1dd2c2628f1e8ecbc76a7ed2eb4423131ab44ebd7f95741e92d82aacb824dfecb0b597
    HEAD_REF main
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

#file(COPY "${SOURCE_PATH}/llama_cpp" DESTINATION "${CURRENT_PACKAGES_DIR}/tools/python3/Lib/site-packages")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

vcpkg_python_test_import(MODULE "scikit_build_core")
