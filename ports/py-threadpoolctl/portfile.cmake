# threadpoolctl 3.6.0 is the last release and still uses the legacy
# [tool.flit.metadata] pyproject table, which flit_core 4 rejects with:
#   ConfigError: The [tool.flit.metadata] table is no longer supported.
# Upstream has not yet released a version migrated to [project]
# (see https://github.com/joblib/threadpoolctl).
# Since threadpoolctl is pure Python and upstream already publishes a
# py3-none-any wheel built with the older flit_core, install that wheel
# directly instead of rebuilding from the sdist.
vcpkg_download_distfile(wheel
    URLS "https://files.pythonhosted.org/packages/32/d5/f9a850d79b0851d1d4ef6456097579a9005b31fea68726a4ae5f2d82ddd9/threadpoolctl-${VERSION}-py3-none-any.whl"
    FILENAME "threadpoolctl-${VERSION}-py3-none-any.whl"
    SHA512 07e94fb472e7a3710e7dd331ba6ff9b827f6eeccb13bd25922ed832f5ee454ad86c4edfc61a1587525ea976f33bdac20773a5b42c8c160ade2ffb7c409c19783
)

vcpkg_python_install_wheel(WHEEL "${wheel}")

vcpkg_install_copyright(FILE_LIST "${CURRENT_PACKAGES_DIR}/${PYTHON3_SITE}/threadpoolctl-${VERSION}.dist-info/licenses/LICENSE")
vcpkg_python_test_import(MODULE "threadpoolctl")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
