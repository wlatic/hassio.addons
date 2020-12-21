ARG BUILD_FROM=hassioaddons/base
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Set workdir
WORKDIR /opt

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apk add --no-cache \
        g++=9.3.0-r2 \
        gcc=9.3.0-r2 \
        libc-dev=0.7.2-r3 \
        linux-headers=5.4.5-r1 \
        make=4.3-r0 \
        py3-pip=20.1.1-r0 \
        python3-dev=3.8.5-r0 
RUN \
apk add --no-cache \
        python3=3.8.5-r0 

RUN \
apk add py3-cryptography py3-pip python3 

RUN \ 
python3 -m pip install tinytuya

COPY rootfs /

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="Tuya Grab" \
    io.hass.description="Grabbing your Tuya Local Keys Easily" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Wlatic" \
    org.opencontainers.image.title="Tuya Grab" \
    org.opencontainers.image.description="Grabbing your Tuya Local Keys Easily" \
    org.opencontainers.image.vendor="Wlatic Add-ons" \
    org.opencontainers.image.authors="Wlatic" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.url="https://github.com/wlatic" \
    org.opencontainers.image.source="https://github.com/wlatic/hassio.addons/addon-tuyagrab" \
    org.opencontainers.image.documentation="https://raw.githubusercontent.com/wlatic/hassio.addons/master/addon-tuyagrab/tuyagrab/DOCS.md" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.revision=${BUILD_REF} \
    org.opencontainers.image.version=${BUILD_VERSION}
