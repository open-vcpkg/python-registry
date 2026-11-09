vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO pydantic/typing-inspection
    REF v${VERSION}
    SHA512 299bc412e34aabdd3cc4146e4cef9408e604e6f93391f113b4bebcf37c7c232a0272ce29b1ec18c7f577676aab19ca6270456fa5a9ae4d6bd2284e5bb3757677
    HEAD_REF main
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_python_test_import(MODULE "typing_inspection")
