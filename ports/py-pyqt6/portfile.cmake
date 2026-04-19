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

vcpkg_install_python_build_dependency(
    PACKAGE "pyqt-builder==1.19.1"
    HASHES
        "sha256:6af6646ba29668751b039bfdced51642cb510e300796b58a4d68b7f956a024d8"
        "sha256:bb8a348479c25db54aa37542fcc98b6c28bb057c9dbac07ddf2424df2084951a"
)
vcpkg_install_python_build_dependency(
    PACKAGE "pyqt6-sip==13.11.1"
    HASHES
        "sha256:0c6d097aae7df312519e2b36e001bd796f6a2ce060ab8b9ed793daa8f407fe2e"
        "sha256:0df15849946cea969d3ff2b24b76149262b6044aea2c5403e4f70c24c973a4c8"
        "sha256:0ee652b272373c4f9287625ef32ad4ec1f0755c24928dc958a870b7a928b288c"
        "sha256:1d1c67179c1924b28e3d7f04585639e7a7c0946f62390efc6ccf2a6206e595d3"
        "sha256:353d613129316e9f7eda6bbe821deb7b7ffa14483499189171fd8a246873f9ac"
        "sha256:3af7a49dce4c35c5464309232c81cc1da5ec6074f46d2957831ee4031b8eefa6"
        "sha256:42b62530a9b6a9c6e29c2941b8ab78258652da0aeae4eb1fc9a0631d19a7a7b2"
        "sha256:581e287bf42587593b88b30d9db06ed0fccbf40f345a5bd3ec3f00a5692e2430"
        "sha256:6aa6c15ad3a9bb86e69119baff77b4ac17c47e55ee567abff616a4652051a6cc"
        "sha256:7677fa1d0e3f933838e5dd8e03ebd6cd4dfc994c9e9b24e8aabd1b3ccecb2430"
        "sha256:7a1b08421967e68a821d3ea97fcdc8413671aec817a0dc46b844ab4bb2ebab66"
        "sha256:869c5b48afe38e55b1ee0dd72182b0886e968cc509b98023ff50010b013ce1be"
        "sha256:98db8ed37cf08130e1ee74b8ff47a6bfb8c3cdfe826310597a630a50e47feedc"
        "sha256:a2456a8a68de43f400ffd13f7f8728713434ded374e45fa7754afb9e087b2421"
        "sha256:a72f4ebdab16a8a484019ff593de90d8013d3286b678c6ba1c0bdb117f4fcb13"
        "sha256:b68e442efc4275651bf63f2c43713e242924fd948909e31cf8f20d783ca505e9"
        "sha256:ba9d362dd1e54b43bc2594f8841e1e39d24789716d28f08e5c9282af9fca342c"
        "sha256:c0ec2128c174db352bec1c8d23a437e970e8d5a78ac50315d8dfc671fcf7a7da"
        "sha256:c52b2b27fc77d9447a8dc1c6de1aaccc22d41e48697aafb2f2f20b8984bb02a5"
        "sha256:ca24bfd4d5d8274e338433df9ac41930650088c00018d3313c6bd8de21772a02"
        "sha256:cb931c1af45294bbe8039c5cfda184e3023f5dc766fc884964010eedd8fd85db"
        "sha256:d83543125fe9fdb153e7e446c3b4d056d80ab5953644660633ab3f80e7784194"
        "sha256:dd8be768799be1a29857ea0125b1d365021a8a014c1d746f0df6b7ba0400edef"
        "sha256:f532144c43f2fddcccf2e25df50cdb4a744edb4ce4ba5ed2d0f2cef825197f2f"
        "sha256:fcadd68e09ee24cdda8f8bfcba52e59c9b297055d2c450f0eb89afa61a8dc31a"
)
vcpkg_install_python_build_dependency(
    PACKAGE "sip==6.15.3"
    HASHES
        "sha256:60df2ee1d17f5375dd15f92ed6181937fea3761e094b73ddfcc550991711e007"
        "sha256:bb2516983f9f716d321e5157c00d0de0c12422eba73b8f43a44610a0f6622438"
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
