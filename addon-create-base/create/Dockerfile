ARG BUILD_FROM=hassioaddons/base:8.0.6
# hadolint ignore=DL3006
FROM ${BUILD_FROM}



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
