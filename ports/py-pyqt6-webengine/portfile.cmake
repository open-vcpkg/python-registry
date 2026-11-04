set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
set(VCPKG_BUILD_TYPE release)

# Downloaded directly instead of through the pythonhosted helper, so that the
# update script does not bump it past the Qt WebEngine version provided by vcpkg
vcpkg_download_distfile(ARCHIVE
    URLS "https://files.pythonhosted.org/packages/source/P/PyQt6-WebEngine/pyqt6_webengine-${VERSION}.tar.gz"
    FILENAME "pyqt6_webengine-${VERSION}.tar.gz"
    SHA512 9c1602a97721f91640b2479e80662b3c342c28ed156ccafc6d1d0fef2c57beba6d8cb466dc770ca445cd2fd19361f03302e5d0bb1bd554cea5209a45319ce38c
)

vcpkg_extract_source_archive(SOURCE_PATH ARCHIVE "${ARCHIVE}")

# https://www.riverbankcomputing.com/static/Docs/PyQt6/installation.html
vcpkg_python_get_qmake(QMAKE)
set(SIPBUILD_ARGS
  "--qmake" "${QMAKE}"
  "--api-dir" "${CURRENT_PACKAGES_DIR}/share/Qt6/qsci/api/python"
  "--verbose"
  "--no-make"
  "--pep484-pyi"
  "--build-dir" "${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-rel"
  # PyQt6's .sip files are looked up in the target dir, so it must be the installed site-packages
  "--target-dir" "${CURRENT_INSTALLED_DIR}/${PYTHON3_SITE}"
)

if(VCPKG_TARGET_IS_OSX)
    if(DEFINED VCPKG_OSX_DEPLOYMENT_TARGET)
        vcpkg_list(APPEND SIPBUILD_ARGS "--qmake-setting" "QMAKE_MACOSX_DEPLOYMENT_TARGET=${VCPKG_OSX_DEPLOYMENT_TARGET}")
    else()
        vcpkg_list(APPEND SIPBUILD_ARGS "--qmake-setting" "QMAKE_MACOSX_DEPLOYMENT_TARGET=10.15")
    endif()
endif()

vcpkg_backup_env_variables(VARS PATH)

vcpkg_add_to_path(PREPEND "${CURRENT_HOST_INSTALLED_DIR}/tools/python3/Scripts/" "${CURRENT_HOST_INSTALLED_DIR}/tools/Qt6/bin/" "${CURRENT_HOST_INSTALLED_DIR}/bin")

message(STATUS "Running sipbuild...")
vcpkg_execute_required_process(
    COMMAND "${PYTHON3}" "-m" "sipbuild.tools.build" ${SIPBUILD_ARGS}
    WORKING_DIRECTORY "${SOURCE_PATH}"
    LOGNAME "sipbuild-${TARGET_TRIPLET}"
)
message(STATUS "Running sipbuild...finished.")

# inventory.txt is consumed by the distinfo tool which is run during make and should be run against the package directory
file(TO_NATIVE_PATH "${CURRENT_INSTALLED_DIR}" NATIVE_INSTALLED_DIR)
vcpkg_replace_string("${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-rel/inventory.txt"
            "${CURRENT_INSTALLED_DIR}"
            "${CURRENT_PACKAGES_DIR}")
vcpkg_replace_string("${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-rel/inventory.txt"
            "${NATIVE_INSTALLED_DIR}"
            "${CURRENT_PACKAGES_DIR}")

vcpkg_qmake_build(BUILD_LOGNAME "install" TARGETS "install")

vcpkg_restore_env_variables(VARS PATH)

vcpkg_python_test_import(MODULE "PyQt6.QtWebEngineCore")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
