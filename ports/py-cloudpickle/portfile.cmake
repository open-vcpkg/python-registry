# cloudpickle 3.1.2 still describes itself with the legacy
# [tool.flit.metadata] pyproject table, which flit_core 4 rejects with:
#   ConfigError: The [tool.flit.metadata] table is no longer supported.
# Upstream has not yet released a version migrated to [project]
# (see https://github.com/cloudpipe/cloudpickle).
# Since cloudpickle is pure Python and upstream already publishes a
# py3-none-any wheel built with the older flit_core, install that wheel
# directly instead of rebuilding from the sdist.
vcpkg_download_distfile(wheel
    URLS "https://files.pythonhosted.org/packages/88/39/799be3f2f0f38cc727ee3b4f1445fe6d5e4133064ec2e4115069418a5bb6/cloudpickle-${VERSION}-py3-none-any.whl"
    FILENAME "cloudpickle-${VERSION}-py3-none-any.whl"
    SHA512 9558ebb6c75062a48f68934107c28ecee46ef4dbdeb25722c901a328fb8cd09ea7eaef4a437e3a616725d651dea7fc36000629f3661156e4e3812dde17201af4
)

vcpkg_python_install_wheel(WHEEL "${wheel}")

vcpkg_install_copyright(FILE_LIST "${CURRENT_PACKAGES_DIR}/${PYTHON3_SITE}/cloudpickle-${VERSION}.dist-info/licenses/LICENSE")
vcpkg_python_test_import(MODULE "cloudpickle")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
