FROM docker.io/library/ubuntu:24.04

LABEL org.opencontainers.image.authors="jahrik@gmail.com"

# Specify any standard chown format (uid, uid:gid), default to root:root
ENV GOSU_USER=0:0

# Specify any space delimited directories that should be chowned to GOSU_USER
# ENV GOSU_CHOWN /tmp

# gosu for easy step-down from root, tini as init
# hadolint ignore=DL3008
RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends gosu tini; \
	rm -rf /var/lib/apt/lists/*; \
# verify that the binaries work
	gosu nobody true; \
	tini -- true

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
