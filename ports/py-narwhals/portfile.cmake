set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    narwhals
    VERSION         ${VERSION}
    SHA512          949a12f3b3a35a2825c3239f5b6d6aae093c4b98c81141ecf1ce8c62f506cbb0ad52f0cd9d2ea383c87dcd3124d1eaa66559ad25e2390e47300247a715f8f765
)

# uv_build is not available, build with hatchling instead
# (matched by regex so that upstream bumping the uv_build version range does not break this)
vcpkg_replace_string("${SOURCE_PATH}/pyproject.toml"
    "requires = \\[\"uv_build[^\n]*\nbuild-backend = \"uv_build\""
    "requires = [\"hatchling\"]\nbuild-backend = \"hatchling.build\"\n\n[tool.hatch.build.targets.wheel]\npackages = [\"src/narwhals\"]"
    REGEX
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.md")

vcpkg_python_test_import(MODULE "narwhals")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
