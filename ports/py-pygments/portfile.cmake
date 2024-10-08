vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO pygments/pygments
    REF 04a75bd5a75bfe27f0b582dd83c85e62f9475581
    SHA512 2907452760ac8365534c06547cdcbfe3a77a42df7775c1e552bd21c18288ea4b133b9b070ac73fea3ba1eb562d3193f615ac55290b1c833806bd562fc34442bc
    HEAD_REF main
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
