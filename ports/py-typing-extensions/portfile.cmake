vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO python/typing_extensions
    REF ${VERSION}
    SHA512 bcb4b953eb74e667570a530c3e7ebf94b37a92c898a25059f6c650c620511af7c8bdcdd2a8b33dd6a543f352220eba475fd924a9657babf70b8f85ed638ae56c
    HEAD_REF main
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_python_test_import(MODULE "typing_extensions")
