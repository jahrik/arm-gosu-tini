# arm-gosu-tini

[![Build](https://github.com/jahrik/arm-gosu-tini/actions/workflows/build.yml/badge.svg)](https://github.com/jahrik/arm-gosu-tini/actions/workflows/build.yml)

Multi-arch Ubuntu base image with [gosu](https://github.com/tianon/gosu) and [tini](https://github.com/krallin/tini): the entrypoint drops privileges per `GOSU_USER`, then runs your command under tini as PID 1.

## Run

```bash
docker run --rm -e GOSU_USER=nobody:nogroup jahrik/arm-gosu-tini:latest ps -p 1 -o user=,comm=
# nobody   tini
```

Set `GOSU_CHOWN` to chown directories before stepping down.

## Build

```bash
make build
make push
```

CI: PR builds + step-down/PID 1 checks; merge to main pushes multi-arch (amd64/arm64/armv7) to Docker Hub.
