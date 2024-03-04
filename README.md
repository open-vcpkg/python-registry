# vcpkg-python

Additional python ports for vcpkg

Usage
Enable registries feature flag in vcpkg and write a vcpkg-configuration.json file（or a vcpkg-configuration field in vcpkg.json) like this in your project's root directory, and you're good to go.

```json
{
    "registries": [
      {
        "kind": "git",
        "repository": "https://github.com/open-vcpkg/vcpkg-python.git",
        "packages": [ "List the packages to use from this registry here" ]
      }
    ]
}
```

## Contributions

Contributions are very welcome 👋

### Using pre-commit hook to automatically format files

Install and enable pre-commit in your local git clone to automatically
have manifest files formatted whenever you `git commit` something.

```console
pip install pre-commit
pre-commit install
```