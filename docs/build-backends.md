# Build backend handling

Some upstream Python packages declare a `[build-system]` backend that this
registry cannot use as-is. This note explains how we handle them and, in
particular, the `uv_build` case.

## The `uv_build` case

`uv_build` (PyPI package `uv-build`) is the Rust-based build backend shipped by
Astral as a slimmed-down part of `uv`. A growing number of newly scaffolded
packages declare it:

```toml
[build-system]
requires = ["uv_build>=0.11.0,<0.12.0"]
build-backend = "uv_build"
```

There is **no `py-uv-build` port** in this registry, so a port that builds
straight from the sdist would fail to find the backend.

### What we do instead

For **pure-Python** packages we patch `pyproject.toml` to use `hatchling`
instead. The build output (a pure-Python wheel) is byte-for-byte equivalent
regardless of which backend produced it, so the swap is functionally
transparent. See [`ports/py-narwhals/use-hatchling.patch`](../ports/py-narwhals/use-hatchling.patch)
for the reference example.

```toml
[build-system]
requires = ["hatchling"]
build-backend = "hatchling.build"

[tool.hatch.build.targets.wheel]
packages = ["src/<package>"]
```

Note the `[tool.hatch.build.targets.wheel] packages = [...]` line: `uv_build`
infers the package layout automatically, but `hatchling` must be told where the
importable package lives. **This value is package-specific** (it depends on the
source layout, e.g. `src/narwhals`), which is the main reason the override is a
hand-written per-port patch rather than a generic transform.

## Why not a `py-uv-build` port?

Adding a real `py-uv-build` host port is feasible — its sdist builds via
`maturin` and the registry already has the Rust toolchain
([`ports/vcpkg-tool-rust`](../ports/vcpkg-tool-rust/), used by
[`ports/py-rpds`](../ports/py-rpds/portfile.cmake)). It would be *truly*
generic: a consumer would just add a host dependency and drop the patch.

We deliberately do **not** do this yet, because:

- **All current consumers are pure-Python.** Compiling a Rust binary backend
  purely to emit pure-Python wheels is pure overhead.
- **Heavy build.** `uv_build` pulls in a large slice of the `uv` cargo
  dependency graph. Even though it is a cached host tool, it is rebuilt on every
  version bump.
- **Toolchain coupling.** The sdist ships a `rust-toolchain.toml`. `uv` tracks
  recent Rust closely, so over time `uv_build` bumps may outrun the version
  pinned by `vcpkg-tool-rust` (currently 1.91.1), forcing coupled toolchain
  bumps — trading a trivial patch for recurring toolchain chasing.

## Why not auto-generate the override in `update-ports.py`?

Because the hatchling override is **not mechanically uniform**: the
`packages = [...]` target depends on each package's source layout. Automating it
would require the updater to download and extract every sdist, parse
`pyproject.toml`, infer the package directory, and synthesise a layout-specific
patch — fragile, for little gain given the low volume of affected packages.

## Decision rule

> **Patch to hatchling while the consumers are pure-Python. Add a `py-uv-build`
> port the moment a package needs the real uv backend (e.g. a non-pure-Python
> build).**

## Keeping the patch robust across version bumps

`scripts/update-ports.py` bumps a port's `version` and `SHA512` but does **not**
touch patches. To minimise the chance that a routine version bump breaks the
override:

- Keep the patch context **minimal** — anchor only on the stable `[build-system]`
  block, not on surrounding comments or the `[project]` table.
- Blank context lines inside a hunk must start with a single space; an
  accidentally-emptied blank line makes `git apply` fail with `corrupt patch`.

If a bump does break the patch, the fix is a one-line update to the removed
`requires = ["uv_build...]` line (its version range changes between releases).
After editing a patch, refresh the version database:

```sh
vcpkg x-add-version py-<name> --overwrite-version \
  --x-builtin-ports-root=./ports \
  --x-builtin-registry-versions-dir=./versions
```
