vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO FFY00/python-pyproject-metadata
    REF ${VERSION}
    SHA512 9878c3a39391de8339c78263f6e1f042b04d3bdf1e28b126fed6878346fa67f833989ae89bff94d3b93bd78f697512d7783cdbefcc127629130dfc32c4e6eba6
    HEAD_REF main
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_python_test_import(MODULE "pyproject_metadata")
