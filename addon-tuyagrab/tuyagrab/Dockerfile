ARG BUILD_FROM=hassioaddons/base:8.0.6
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

RUN apk add --no-cache \
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
    io.hass.name="Node-RED" \
    io.hass.description="Flow-based programming for the Internet of Things" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Franck Nijhof <frenck@addons.community>" \
    org.opencontainers.image.title="Node-RED" \
    org.opencontainers.image.description="Flow-based programming for the Internet of Things" \
    org.opencontainers.image.vendor="Home Assistant Community Add-ons" \
    org.opencontainers.image.authors="Franck Nijhof <frenck@addons.community>" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.url="https://addons.community" \
    org.opencontainers.image.source="https://github.com/hassio-addons/addon-node-red" \
    org.opencontainers.image.documentation="https://github.com/hassio-addons/addon-node-red/blob/master/README.md" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.revision=${BUILD_REF} \
    org.opencontainers.image.version=${BUILD_VERSION}
