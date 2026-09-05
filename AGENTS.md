# AGENTS.md

Multi-arch base image: Ubuntu + [gosu](https://github.com/tianon/gosu) + [tini](https://github.com/krallin/tini). Entrypoint steps down via `GOSU_USER`/`GOSU_CHOWN`, then runs the command under tini as PID 1.

## Commands

```bash
just build                                  # build jahrik/arm-gosu-tini:latest
docker run --rm -e GOSU_USER=nobody:nogroup jahrik/arm-gosu-tini:latest id -un
```

## CI

`build.yml`: Test (build + step-down + PID 1 = tini checks) on PR; Release (buildx amd64/arm64/armv7 push to Docker Hub) on merge to main. Needs `DOCKERHUB_USERNAME`/`DOCKERHUB_TOKEN` secrets.

## Quirks

- Originally built `FROM jahrik/arm-tini`; now both tools come from Ubuntu's apt repo in one layer (unpinned; hadolint DL3008 ignored on purpose).
- Base-image repo: no compose, no swarm stack.
