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
        "packages": [
          "python3",
          "vcpkg-python-scripts",
          "py-*"
        ]
      }
    ]
}
```

## Contributions

Contributions are very welcome 👋
