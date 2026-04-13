set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)
set(VCPKG_BUILD_TYPE release)

vcpkg_from_pythonhosted(
    OUT_SOURCE_PATH SOURCE_PATH
    PACKAGE_NAME    PyQt6
    VERSION         ${VERSION}
    SHA512          d58515d181530fdd71edc3edfa0b647a3aeeb56cbc33f4d7fd0d40a7a99d52298ac5bb4438b5dadea5439759e52cc459e601f1fab5d9afdd61f2a492d0bae1ef
    FILENAME        pyqt6
)

# https://www.riverbankcomputing.com/static/Docs/PyQt6/installation.html
set(SIPBUILD_ARGS
  "--confirm-license"
  "--qmake" "${CURRENT_HOST_INSTALLED_DIR}/tools/Qt6/bin/qmake${VCPKG_HOST_EXECUTABLE_SUFFIX}"
  "--api-dir" "${CURRENT_PACKAGES_DIR}/share/Qt6/qsci/api/python"
  "--verbose"
  "--qt-shared"
  "--no-make"
  "--disable" "QtDesigner"
  "--pep484-pyi"
  "--build-dir" "${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-rel"
  "--target-dir" "${PYTHON3_SITEPACKAGES}"
  "--scripts-dir" "${CURRENT_PACKAGES_DIR}/bin"
)

if(VCPKG_TARGET_IS_OSX)
    if(DEFINED VCPKG_OSX_DEPLOYMENT_TARGET)
        vcpkg_list(APPEND SIPBUILD_ARGS "--qmake-setting" "QMAKE_MACOSX_DEPLOYMENT_TARGET=${VCPKG_OSX_DEPLOYMENT_TARGET}")
    else()
        # https://doc.qt.io/qt-6/macos.html
        vcpkg_list(APPEND SIPBUILD_ARGS "--qmake-setting" "QMAKE_MACOSX_DEPLOYMENT_TARGET=10.15")
    endif()
    vcpkg_list(APPEND SIPBUILD_ARGS "--no-dbus-python")
endif()

vcpkg_install_python_build_dependencies(
    PACKAGES 
        "sip"
        "PyQt-builder"
        "PyQt6-sip"
)

# fix shebangs for host binaries
file(GLOB sip_binaries "${PYTHON3_BUILD_VENV}/bin/sip-*")
foreach(binary IN LISTS sip_binaries)
    vcpkg_replace_string(${binary}
            "#!${PYTHON3_BUILD_VENV}/bin/python"
            "#!/usr/bin/env python" IGNORE_UNCHANGED)
endforeach()


message(STATUS "Running sipbuild...")
vcpkg_execute_required_process(
    COMMAND "${PYTHON3_BUILD_VENV}/bin/python" "-m" "sipbuild.tools.build" ${SIPBUILD_ARGS}
    WORKING_DIRECTORY "${SOURCE_PATH}"
    LOGNAME "sipbuild-${TARGET_TRIPLET}"
)
message(STATUS "Running sipbuild...finished.")

# inventory.txt is consumed by the distinfo tool which is run during make and should be run against the package directory
file(TO_NATIVE_PATH "${CURRENT_INSTALLED_DIR}" NATIVE_INSTALLED_DIR)
vcpkg_replace_string("${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-rel/inventory.txt"
            "${CURRENT_INSTALLED_DIR}"
            "${CURRENT_PACKAGES_DIR}" IGNORE_UNCHANGED)
vcpkg_replace_string("${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-rel/inventory.txt"
            "${NATIVE_INSTALLED_DIR}"
            "${CURRENT_PACKAGES_DIR}" IGNORE_UNCHANGED)

vcpkg_qmake_build(BUILD_LOGNAME "install" TARGETS "install")

vcpkg_python_test_import(MODULE "PyQt6.QtCore")
