# Development

Scripts used to build and publish the `devopsplaybookio/kubectl` Docker image.

These scripts are also invoked by the GitHub Actions workflows in [../../.github/workflows](../../.github/workflows), so their location and names must be preserved.

## Prerequisites

- Docker with `buildx` enabled (multi-platform builds)
- QEMU support for cross-architecture builds
- Logged in to Docker Hub (`docker login`)
- `jq` to read the version from `package.json`

## Scripts

| Script                          | Purpose                                                             |
| ------------------------------- | ------------------------------------------------------------------- |
| `docker-build-images.sh`        | Builds and pushes the release tags (`latest`, full/major/minor versions) |
| `docker-build-images-beta.sh`   | Builds and pushes the `beta` tag for pre-release validation          |

Both scripts build for `linux/amd64` and `linux/arm64/v8` and push directly to Docker Hub (`--push`).

The version is read from `package.json`, and the following tags are produced by `docker-build-images.sh` (for version `0.1.0`):

- `devopsplaybookio/kubectl:latest`
- `devopsplaybookio/kubectl:0.1.0`
- `devopsplaybookio/kubectl:0.1`
- `devopsplaybookio/kubectl:0`

## Usage

From the repository root:

```bash
./docs/dev/docker-build-images.sh       # Release build
./docs/dev/docker-build-images-beta.sh  # Beta build
```
