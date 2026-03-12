vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO pyparsing/pyparsing
    REF ${VERSION}
    SHA512 384f9271a1b4ae37cb1ab489aa996c08fe8674aaae897f21e05f90064aef873a8361f11452f2a2265da4e61a6a87df58be2857e43305f8969b379d4ebc4cb656
    HEAD_REF master
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
