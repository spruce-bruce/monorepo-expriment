FROM node:13.12.0-alpine3.11 as base

# Install runtime deps.
RUN set -xe; \
    apk add --update  --no-cache --virtual .runtime-deps \
        bash \
        build-base \
        ca-certificates \
        coreutils \
        rsync \
        tzdata \
        zsh;

COPY . /monorepo

ARG YARN_CHECKSUM_BEHAVIOR=update
RUN set -xe; \
    cd /monorepo; \
    yarn install; \
    npm install -g pm2;

# Setup our environment variables.
ENV \
    PATH="/usr/local/bin:$PATH" \
    VERSION="${VERSION}"

# Set the default command (Do nothing)
CMD ["/bin/sh", "-c", "tail -f /dev/null"]

# Service Image
FROM base as service

WORKDIR /monorepo

# Build arguments.
ARG VCS_REF=master
ARG BUILD_DATE
ARG VERSION=0.1.0

# Labels / Metadata.
LABEL \
    org.opencontainers.image.authors="James Brink <james@synapsestudios.com>" \
    org.opencontainers.image.created="${BUILD_DATE}" \
    org.opencontainers.image.description="SynapseStudios MonoRepo Expirment ${PACKAGE}" \
    org.opencontainers.image.revision="${VCS_REF}" \
    org.opencontainers.image.source="https://github.com/spruce-bruce/monorepo-expriment" \
    org.opencontainers.image.title="monorepo-expriment-${PACKAGE}" \
    org.opencontainers.image.vendor="synapsestudios.com" \
    org.opencontainers.image.version="${VERSION}"

# Setup our environment variables.
ENV \
    PATH="/usr/local/bin:$PATH" \
    VERSION="${VERSION}"

# Expose http port
EXPOSE 9000
