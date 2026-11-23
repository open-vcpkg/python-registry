
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO certifi/python-certifi
    REF 2026.11.20
    SHA512 a247e04860a5c1495e4d156e3576edae8a58bd75d41e03bfdf531c27f276798e4b3f47d2cc7ca8134921d560f6529165638ed6509dc2a83692433e83ce912a1b
    HEAD_REF 2026.02.25
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_python_test_import(MODULE "certifi")
