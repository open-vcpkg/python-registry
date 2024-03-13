import os
import sys
from pathlib import Path

vcpkg_bin_path = Path(sys.prefix) / '/../../bin'
if not vcpkg_bin_path.is_dir():
  raise RuntimeError('Could not add "{vcpkg_bin_path}" to dll paths because it does not exist.')
os.add_dll_directory(vcpkg_bin_path)