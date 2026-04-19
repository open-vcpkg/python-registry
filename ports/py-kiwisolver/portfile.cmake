vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO nucleic/kiwi
    REF ${VERSION}
    SHA512 9b217309cf800d8843b4c4d1b85e7f3e40a45655cdf9911ebbacd2985356ed067d4281c66e511aeea2b5b0ebce60a063b0a38e87049aad05e30296e6cf8458fa
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

vcpkg_install_python_build_dependency(
    PACKAGE "cppy"
    VERSION "1.3.1"
    HASHES
        "sha256:55b5307c11874f242ea135396f398cb67a5bbde4fab3e3c3294ea5fce43a6d68"
        "sha256:7ca132b6ef6187384738804bd3a453d4eab7e3274df6dcd35e5d92aae3404717"
)

vcpkg_python_build_and_install_wheel(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

set(VCPKG_POLICY_EMPTY_INCLUDE_FOLDER enabled)

vcpkg_python_test_import(MODULE "kiwisolver")

