set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    "lazy-loader"
    VERSION         ${VERSION}
    SHA512          29e3589929869351ea62cf7cbba86b581bd7935918b54cfd5ac107cbf7cc427d6d4e050ec1f9bef084587e55286d7afa31d5cdb6deb7d072d25493d19d6bbce6
    FILENAME        lazy_loader
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.md")

vcpkg_python_test_import(MODULE "lazy_loader")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
