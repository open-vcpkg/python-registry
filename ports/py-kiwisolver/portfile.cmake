vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO nucleic/kiwi
    REF ${VERSION}
    SHA512 4f1a7107c88adcbd6004d3e28d2f345919d3e0a912036b5406240e42c4b9f34fe2c170c3f4ed9c6286234e2c9cb03ae59a73fb0bc09106cf77bca5cdc267abb2
    HEAD_REF master
)


file(WRITE "${SOURCE_PATH}/py/src/version.h" 
"\n\
/* ----------------------------------------------------------------------------\n\
| Copyright (c) 2013-2021, Nucleic Development Team.\n\
|\n\
| Distributed under the terms of the Modified BSD License.\n\
|\n\
| The full license is in the file LICENSE, distributed with this software.\n\
| ---------------------------------------------------------------------------*/\n\
\n\
#pragma once\n\
\n\
#define PY_KIWI_VERSION \"${VERSION}\"\n\
\n"
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_python_test_import(MODULE "kiwisolver")

