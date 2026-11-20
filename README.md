# Cloudflared (Multi-Arch)

Automated multi-arch Docker image for [Cloudflare Tunnel (`cloudflared`)](https://github.com/cloudflare/cloudflared) built directly from official release tags on `gcr.io/distroless/base-debian13:nonroot` with `linux/amd64`, `linux/arm64`, and `linux/arm/v7` support.

## Image

```
ghcr.io/potatoptt/cloudflared:latest
ghcr.io/potatoptt/cloudflared:<version>
```

## Supported Platforms

| Platform | Build |
|---|---|
| `linux/amd64` | Cross-compiled Go static binary (`CGO_ENABLED=0`) |
| `linux/arm64` | Cross-compiled Go static binary (`CGO_ENABLED=0`) |
| `linux/arm/v7` | Cross-compiled Go static binary (`CGO_ENABLED=0`, `GOARM=7`) |

## How it works

A scheduled GitHub Actions workflow checks daily for new `cloudflare/cloudflared` releases:
1. Checks if the release tag already exists in GHCR with all three platform manifests.
2. Clones the matching `cloudflare/cloudflared` tag and cross-compiles static Go binaries for `amd64`, `arm64`, and `arm/v7` using the exact Go toolchain from `go.mod`.
3. Builds and smoke-tests all three images (`cloudflared version` and `cloudflared tunnel --help`) on `gcr.io/distroless/base-debian13:nonroot`.
4. Publishes a single multi-arch OCI manifest to `ghcr.io/potatoptt/cloudflared`.
