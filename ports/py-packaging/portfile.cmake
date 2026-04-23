vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO pypa/packaging
    REF ${VERSION}
    SHA512 811d1fd2302053d6039c4746f6c5ed911f2907e89c56d71a68016a42d488d23ef26f1be4e2dd1e19175d3d0484d12f9cb0b5942d9c31ac388a8ed0f147d15ab0
    HEAD_REF main
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_python_test_import(MODULE "packaging")
