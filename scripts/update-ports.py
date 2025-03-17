import os
import re
import requests
import hashlib
import json
import subprocess

# Base directory of the ports folder
PORTS_DIR = "ports"


# Function to calculate SHA512 checksum of a file
def calculate_sha512(file_path):
    sha512 = hashlib.sha512()
    with open(file_path, "rb") as f:
        while chunk := f.read(8192):
            sha512.update(chunk)
    return sha512.hexdigest()


# Loop over all subfolders that match the pattern py-* and contain portfile.cmake
for root, dirs, files in os.walk(PORTS_DIR):
    for dir_name in dirs:
        if dir_name.startswith("py-"):
            dir_path = os.path.join(root, dir_name)
            portfile_cmake = os.path.join(dir_path, "portfile.cmake")
            vcpkg_json = os.path.join(dir_path, "vcpkg.json")

            # Check if portfile.cmake exists
            if os.path.isfile(portfile_cmake):
                with open(portfile_cmake, "r") as f:
                    portfile_content = f.read()

                    # Check if the portfile contains "vcpkg_from_pythonhosted"
                    if "vcpkg_from_pythonhosted" in portfile_content:

                        # Check for PYPI_PROJECT_NAME
                        pypi_project_match = re.search(
                            r"# PYPI_PROJECT_NAME\s+\[([^\]]+)\]", portfile_content
                        )
                        if pypi_project_match:
                            pypi_project_name = pypi_project_match.group(1)
                            print(f"    Using PYPI_PROJECT_NAME: {pypi_project_name}")
                        else:
                            pypi_project_name = dir_name.replace("py-", "", 1)

                        package_name_match = re.search(
                            r"PACKAGE_NAME\s+([^\s]+)", portfile_content
                        )
                        if package_name_match:
                            package_name = package_name_match.group(1)
                        else:
                            # If PACKAGE_NAME is not set, strip the py- prefix from the folder name
                            package_name = dir_name.replace("py-", "", 1)

                        print(f"Updating {dir_name}")

                        # Query the PyPI API for the latest package info
                        pypi_url = f"https://pypi.org/pypi/{package_name}/json"
                        response = requests.get(pypi_url)

                        if response.status_code != 200:
                            print(f"  Failed to query PyPI for {package_name}")
                            continue

                        pypi_data = response.json()

                        # Extract the latest version and source URL from the PyPI response
                        latest_version = pypi_data.get("info", {}).get("version")
                        pypi_project_name = pypi_data.get("info", {}).get("name")
                        source_url = None

                        for release in pypi_data.get("urls", []):
                            if release.get("packagetype") == "sdist":
                                source_url = release.get("url")
                                source_filename = release.get("filename")
                                break

                        if not latest_version or not source_url:
                            print(
                                f"  Failed to get version or source URL for {package_name}"
                            )
                            continue

                        if os.path.isfile(vcpkg_json):
                            with open(vcpkg_json, "r") as f:
                                vcpkg_data = json.load(f)

                            current_version = vcpkg_data.get("version")
                            if current_version == latest_version:
                                print(
                                    f"  Version for {package_name} is already up to date ({current_version}). Skipping..."
                                )
                                continue

                            print(
                                f"  Updating {package_name} to version {latest_version} with source URL {source_url}"
                            )

                            # Remove "port-version" if it exists
                            vcpkg_data.pop("port-version", None)

                            # Update version in vcpkg.json
                            vcpkg_data["version"] = latest_version

                            # Write the updated data back to vcpkg.json
                            with open(vcpkg_json, "w") as f:
                                json.dump(vcpkg_data, f, indent=2)

                            print(
                                f"  Updated {vcpkg_json} to version {latest_version} (removed port-version if present)"
                            )
                        else:
                            print(f"  vcpkg.json not found in {dir_path}")

                        # Download the source file and calculate SHA512 checksum
                        temp_file = requests.get(source_url, stream=True)
                        temp_file_path = os.path.join(dir_path, "temp_source_file")
                        with open(temp_file_path, "wb") as f:
                            for chunk in temp_file.iter_content(chunk_size=8192):
                                f.write(chunk)
                        sha512_checksum = calculate_sha512(temp_file_path)
                        os.remove(temp_file_path)
                        print(f"Calculated SHA512 checksum: {sha512_checksum}")

                        new_portfile_content = re.sub(
                            r"PACKAGE_NAME\s+[^\s]+",
                            f"PACKAGE_NAME    {pypi_project_name}",
                            portfile_content,
                        )

                        # Check if the source filename prefix matches the PACKAGE_NAME
                        filename_prefix = re.sub(
                            rf"-{re.escape(latest_version)}(\.tar\.gz|\.zip)$",
                            "",
                            source_filename,
                        )
                        if filename_prefix != pypi_project_name:
                            print(f"Setting FILENAME to {filename_prefix}")
                            # Check if FILENAME already exists and replace it
                            if "FILENAME" in new_portfile_content:
                                new_portfile_content = re.sub(
                                    r"(FILENAME\s+)[^\s]+",
                                    f"\\g<1>{filename_prefix}",
                                    new_portfile_content,
                                )
                                new_portfile_content = re.sub(
                                    r"(SHA512\s+)[a-f0-9]+",
                                    f"\\g<1>{sha512_checksum}",
                                    new_portfile_content,
                                )
                            else:
                                # Insert FILENAME after SHA512
                                new_portfile_content = re.sub(
                                    r"(SHA512\s+)[a-f0-9]+",
                                    f"\\g<1>{sha512_checksum}\n    FILENAME        {filename_prefix}",
                                    new_portfile_content,
                                )
                        else:
                            # No FILENAME needed, just update the SHA512
                            new_portfile_content = re.sub(
                                r"(SHA512\s+)[a-f0-9]+",
                                f"\\g<1>{sha512_checksum}",
                                new_portfile_content,
                            )
                            print(f"No FILENAME needed, SHA512 updated")

                        with open(portfile_cmake, "w") as f:
                            f.write(new_portfile_content)
                        print(f"  Updated SHA512 checksum in {portfile_cmake}")
