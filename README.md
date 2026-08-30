# kubectl-image

A lightweight Docker image bundling `kubectl` with a set of common command-line tools, intended for use in CI/CD pipelines, automation jobs, and ad-hoc cluster administration tasks.

The image is published on Docker Hub as [`devopsplaybookio/kubectl`](https://hub.docker.com/r/devopsplaybookio/kubectl).

## Included Tools

The image is based on `alpine:3.21` and ships with:

| Tool      | Purpose                                        |
| --------- | ---------------------------------------------- |
| `kubectl` | Kubernetes cluster management                  |
| `docker`  | Docker CLI (for interacting with Docker daemons) |
| `aws-cli` | Amazon Web Services command line interface     |
| `jq`      | JSON processing                                |
| `curl`    | HTTP requests                                  |
| `bash`    | Shell for scripting                            |
| `gawk`    | Text processing                                |
| `gzip`    | Compression                                    |

## Usage

Run a shell inside the image:

```bash
docker run --rm -it devopsplaybookio/kubectl:latest bash
```

Mount your kubeconfig and run `kubectl` commands against a cluster:

```bash
docker run --rm -it \
  -v ~/.kube:/root/.kube \
  devopsplaybookio/kubectl:latest \
  kubectl get nodes
```

Use it as a base image for your own automation jobs:

```dockerfile
FROM devopsplaybookio/kubectl:latest
COPY ./my-script.sh /my-script.sh
CMD ["/my-script.sh"]
```

## Tags

Tags follow the version defined in `package.json`:

- `latest` — most recent build
- `<major>.<minor>.<patch>` — exact version (e.g. `0.1.0`)
- `<major>.<minor>` — latest patch of a minor version (e.g. `0.1`)
- `<major>` — latest minor of a major version (e.g. `0`)
- `beta` — pre-release builds from pull requests

Images are multi-architecture: `linux/amd64` and `linux/arm64/v8`.

## Building

Build scripts live in [docs/dev](docs/dev). To build and push locally:

```bash
./docs/dev/docker-build-images.sh       # Builds release tags
./docs/dev/docker-build-images-beta.sh  # Builds the beta tag
```

Both scripts require a working `docker buildx` setup and a login to Docker Hub.

## Continuous Integration

GitHub Actions workflows in [.github/workflows](.github/workflows):

- `main-build.yml` — on push to `main`, builds and pushes the release tags
- `pr-check.yml` — on pull request, builds and pushes the `beta` tag for validation
