set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    narwhals
    VERSION         ${VERSION}
    SHA512          852fa659c57148ef5851155f07453cc79015f9a6ee441034ed73ffa8e47b9777ade2400c274259aaf8910992456623eb05db455010d21cdd87e2b3cefa5710f6
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
