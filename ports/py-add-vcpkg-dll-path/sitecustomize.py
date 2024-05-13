import os
import sys
from pathlib import Path

vcpkg_bin_path = Path(sys.prefix) / '/../../bin'
if not vcpkg_bin_path.is_dir():
  raise RuntimeError(f'Could not add "{vcpkg_bin_path}" to dll paths because it does not exist. If you copied the files from vcpkg either delete this file or adjust it accordingly.')
os.add_dll_directory(vcpkg_bin_path)
