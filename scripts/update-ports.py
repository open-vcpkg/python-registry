import os
import re
import requests
import hashlib
import json
import argparse

# Base directory of the ports folder
PORTS_DIR = "ports"


# Function to calculate SHA512 checksum of a file
def calculate_sha512(file_path):
    sha512 = hashlib.sha512()
    with open(file_path, "rb") as f:
        while chunk := f.read(8192):
            sha512.update(chunk)
    return sha512.hexdigest()


def update_pypi_ports():
    updated = []
    failed = []
    unchanged = []

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

                            # Check for PYPI_PROJECT_NAME (supports both bracket and non-bracket formats)
                            pypi_project_match = re.search(
                                r"# PYPI_PROJECT_NAME\s+(?:\[([^\]]+)\]|(\S+))", portfile_content
                            )
                            if pypi_project_match:
                                pypi_project_name = pypi_project_match.group(1) or pypi_project_match.group(2)
                                print(f"    Using PYPI_PROJECT_NAME: {pypi_project_name}")
                            else:
                                pypi_project_name = dir_name.replace("py-", "", 1)

                            package_name_match = re.search(
                                r'PACKAGE_NAME\s+"?([^"\s]+)"?', portfile_content
                            )
                            if package_name_match:
                                package_name = package_name_match.group(1)
                                # Skip unresolved cmake variables
                                if "${" in package_name:
                                    package_name = pypi_project_name
                            else:
                                # If PACKAGE_NAME is not set, strip the py- prefix from the folder name
                                package_name = dir_name.replace("py-", "", 1)

                            print(f"Updating {dir_name}")

                            # Query the PyPI API for the latest package info
                            pypi_url = f"https://pypi.org/pypi/{package_name}/json"
                            response = requests.get(pypi_url)

                            if response.status_code != 200:
                                print(f"  Failed to query PyPI for {package_name}")
                                failed.append(f"{dir_name} (PyPI query failed)")
                                continue

                            pypi_data = response.json()

                            # Extract the latest version and source URL from the PyPI response
                            latest_version = pypi_data.get("info", {}).get("version")
                            pypi_project_name = pypi_data.get("info", {}).get("name")
                            source_url = None

                            # vcpkg relaxed versions only allow digits and dots
                            if latest_version and not re.fullmatch(r"\d+(\.\d+)*", latest_version):
                                print(
                                    f"  Skipping {package_name}: version '{latest_version}' is not a valid vcpkg version"
                                )
                                unchanged.append(dir_name)
                                continue

                            for release in pypi_data.get("urls", []):
                                if release.get("packagetype") == "sdist":
                                    source_url = release.get("url")
                                    source_filename = release.get("filename")
                                    break

                            if not latest_version or not source_url:
                                print(
                                    f"  Failed to get version or source URL for {package_name}"
                                )
                                failed.append(f"{dir_name} (no version or source URL)")
                                continue

                            if os.path.isfile(vcpkg_json):
                                with open(vcpkg_json, "r") as f:
                                    vcpkg_data = json.load(f)

                                current_version = vcpkg_data.get("version")
                                if current_version == latest_version:
                                    print(
                                        f"  Version for {package_name} is already up to date ({current_version}). Skipping..."
                                    )
                                    unchanged.append(dir_name)
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
                                failed.append(f"{dir_name} (vcpkg.json not found)")

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
                            updated.append(f"{dir_name} ({current_version} -> {latest_version})")

    return updated, failed, unchanged


def get_latest_tag(repo, ref_pattern, headers):
    """Get the latest tag for a repo, using releases API first, then tags API as fallback.

    ref_pattern can be:
    - A ${VERSION}-based template like "v${VERSION}" or "${VERSION}" — converted to a regex
    - A raw regex string (if it contains no ${VERSION}) — used as-is
    - None — matches any tag

    Returns (tag_name, version) or (None, None) on failure.
    """
    # Build a regex to match tags that fit the REF pattern
    if ref_pattern and "${VERSION}" in ref_pattern:
        tag_regex = re.escape(ref_pattern).replace(re.escape("${VERSION}"), r"(.+)")
    elif ref_pattern:
        # Already a raw regex (e.g. for version-date matching)
        tag_regex = ref_pattern
    else:
        tag_regex = None

    # Try releases API first
    api_url = f"https://api.github.com/repos/{repo}/releases"
    response = requests.get(api_url, headers=headers, params={"per_page": 20})

    if response.status_code == 200:
        for release in response.json():
            if release.get("draft") or release.get("prerelease"):
                continue
            tag = release.get("tag_name")
            if not tag:
                continue
            if tag_regex:
                m = re.fullmatch(tag_regex, tag)
                if m:
                    return tag, m.group(1)
            else:
                return tag, tag

    # Fall back to tags API
    api_url = f"https://api.github.com/repos/{repo}/tags"
    response = requests.get(api_url, headers=headers, params={"per_page": 20})

    if response.status_code == 403:
        print(f"  GitHub API rate limit exceeded for {repo}")
        return None, None

    if response.status_code != 200:
        return None, None

    for tag_entry in response.json():
        tag = tag_entry.get("name")
        if not tag:
            continue
        if tag_regex:
            m = re.fullmatch(tag_regex, tag)
            if m:
                return tag, m.group(1)
        else:
            return tag, tag

    return None, None


def update_github_ports():
    updated = []
    failed = []
    unchanged = []

    headers = {}
    token = os.environ.get("GITHUB_TOKEN")
    if token:
        headers["Authorization"] = f"token {token}"

    for root, dirs, files in os.walk(PORTS_DIR):
        for dir_name in dirs:
            if not dir_name.startswith("py-"):
                continue

            dir_path = os.path.join(root, dir_name)
            portfile_cmake = os.path.join(dir_path, "portfile.cmake")
            vcpkg_json = os.path.join(dir_path, "vcpkg.json")

            if not os.path.isfile(portfile_cmake):
                continue

            with open(portfile_cmake, "r") as f:
                portfile_content = f.read()

            if "vcpkg_from_github" not in portfile_content:
                continue

            # Parse REPO
            repo_match = re.search(r"REPO\s+(\S+)", portfile_content)
            if not repo_match:
                print(f"  Could not find REPO in {portfile_cmake}")
                continue
            repo = repo_match.group(1)

            # Parse REF (strip optional quotes)
            ref_match = re.search(r'REF\s+"?(\S+?)"?\s*$', portfile_content, re.MULTILINE)
            if not ref_match:
                print(f"  Could not find REF in {portfile_cmake}")
                continue
            ref_value = ref_match.group(1)

            # Skip commit-hash based REFs
            if re.match(r"^[0-9a-f]{40}$", ref_value):
                print(f"Skipping {dir_name}: commit-hash based REF")
                unchanged.append(dir_name)
                continue

            # Determine REF pattern
            uses_version_var = "${VERSION}" in ref_value

            print(f"Updating {dir_name} (GitHub: {repo})")

            # Read vcpkg.json early to determine version scheme
            if not os.path.isfile(vcpkg_json):
                print(f"  vcpkg.json not found for {dir_name}")
                failed.append(f"{dir_name} (vcpkg.json not found)")
                continue

            with open(vcpkg_json, "r") as f:
                vcpkg_data = json.load(f)

            is_version_date = "version-date" in vcpkg_data

            # Build ref_pattern for get_latest_tag
            if uses_version_var:
                ref_pattern = ref_value
            elif is_version_date:
                # For version-date ports with literal REFs, match date-like tags (YYYY.MM.DD)
                ref_pattern = r"(\d{4}\.\d{2}\.\d{2})"
            else:
                ref_pattern = None

            tag_name, version_from_tag = get_latest_tag(repo, ref_pattern, headers)

            if not tag_name:
                print(f"  No matching tag found for {repo}")
                failed.append(f"{dir_name} (no matching tag)")
                continue

            # Determine version key and new version value
            if is_version_date:
                version_key = "version-date"
                new_version = version_from_tag.replace(".", "-")
            elif "version-semver" in vcpkg_data:
                version_key = "version-semver"
                new_version = version_from_tag
            elif "version-string" in vcpkg_data:
                version_key = "version-string"
                new_version = version_from_tag
            else:
                version_key = "version"
                new_version = version_from_tag

            current_version = vcpkg_data.get(version_key)
            if current_version == new_version:
                print(f"  {dir_name} is already up to date ({current_version}). Skipping...")
                unchanged.append(dir_name)
                continue

            print(f"  Updating {dir_name} from {current_version} to {new_version} (tag: {tag_name})")

            # Download tarball and compute SHA512
            tarball_url = f"https://github.com/{repo}/archive/{tag_name}.tar.gz"
            resp = requests.get(tarball_url, stream=True)
            if resp.status_code != 200:
                print(f"  Failed to download tarball from {tarball_url} (status {resp.status_code})")
                failed.append(f"{dir_name} (download failed)")
                continue

            temp_file_path = os.path.join(dir_path, "temp_source_file")
            with open(temp_file_path, "wb") as f:
                for chunk in resp.iter_content(chunk_size=8192):
                    f.write(chunk)
            sha512_checksum = calculate_sha512(temp_file_path)
            os.remove(temp_file_path)
            print(f"  Calculated SHA512 checksum: {sha512_checksum}")

            # Update vcpkg.json
            vcpkg_data.pop("port-version", None)
            vcpkg_data[version_key] = new_version
            with open(vcpkg_json, "w") as f:
                json.dump(vcpkg_data, f, indent=2)
            print(f"  Updated {vcpkg_json} to version {new_version}")

            # Update portfile.cmake SHA512
            new_portfile_content = re.sub(
                r"(SHA512\s+)[a-f0-9]+",
                f"\\g<1>{sha512_checksum}",
                portfile_content,
            )

            # If REF is a literal value (not ${VERSION}), update it too
            if not uses_version_var:
                new_portfile_content = re.sub(
                    r'(REF\s+"?)\S+"?',
                    f"\\g<1>{tag_name}",
                    new_portfile_content,
                )

            with open(portfile_cmake, "w") as f:
                f.write(new_portfile_content)
            print(f"  Updated {portfile_cmake}")
            updated.append(f"{dir_name} ({current_version} -> {new_version})")

    return updated, failed, unchanged


def print_report(title, updated, failed, unchanged):
    print(f"\n{'=' * 60}")
    print(f"  {title}")
    print(f"{'=' * 60}")
    if updated:
        print(f"\n✅ Updated ({len(updated)}):")
        for entry in updated:
            print(f"  + {entry}")
    if failed:
        print(f"\n❌ Failed ({len(failed)}):")
        for entry in failed:
            print(f"  ! {entry}")
    print(f"\n📦 Unchanged: {len(unchanged)}")
    print(f"{'=' * 60}")


def main():
    parser = argparse.ArgumentParser(description="Update vcpkg ports to latest versions")
    parser.add_argument("--pypi", action="store_true", help="Update ports using vcpkg_from_pythonhosted")
    parser.add_argument("--github", action="store_true", help="Update ports using vcpkg_from_github")
    args = parser.parse_args()

    # Default to both if neither specified
    if not args.pypi and not args.github:
        args.pypi = True
        args.github = True

    all_updated = []
    all_failed = []
    all_unchanged = []

    if args.pypi:
        updated, failed, unchanged = update_pypi_ports()
        all_updated.extend(updated)
        all_failed.extend(failed)
        all_unchanged.extend(unchanged)
    if args.github:
        updated, failed, unchanged = update_github_ports()
        all_updated.extend(updated)
        all_failed.extend(failed)
        all_unchanged.extend(unchanged)

    print_report("Summary", all_updated, all_failed, all_unchanged)


if __name__ == "__main__":
    main()
