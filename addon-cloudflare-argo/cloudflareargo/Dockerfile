#ARG BUILD_FROM=hassioaddons/base:7.2.0
ARG BUILD_FROM
FROM $BUILD_FROM

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Setup base
# hadolint ignore=DL3003
#ARG BUILD_ARCH=amd64
ARG BUILD_ARCH
ARG LINKARCH


RUN \
 if [[ "${BUILD_ARCH}" = "aarch64" ]]; then LINKARCH="https://github.com/cloudflare/cloudflared/releases/download/2020.8.2/cloudflared-linux-arm64"; fi \
    && if [[ "${BUILD_ARCH}" = "amd64" ]]; then LINKARCH="https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.tgz"; fi \
    && if [[ "${BUILD_ARCH}" = "armhf" ]]; then LINKARCH="https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-arm.tgz"; fi \
    && if [[ "${BUILD_ARCH}" = "armv7" ]]; then LINKARCH="https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-arm.tgz"; fi \
    && if [[ "${BUILD_ARCH}" = "i386" ]]; then LINKARCH="https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-386.tgz"; fi \
    \
 && mkdir /etc/cloudflared \
 && cd /opt/ \
 && curl -L -s "${LINKARCH}" \
 #| tar xzf - -C /opt/ \
 && chmod +x  /opt/cloudflared 

COPY rootfs /

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="Argo CloudFlare" \
    io.hass.description="Argo Cloudflare Proxy" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="James <@wlatic>" \
    org.label-schema.description="Argo Cloudflare Proxy" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="ArgoCloudflare" \
    org.label-schema.schema-version="0.7" \
    org.label-schema.url="" \
    org.label-schema.usage="https://github.com/wlatic/hassio.addons/tree/master/addon-cloudflare-argo/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/wlatic/docker-cloudflare-argo" \
    org.label-schema.vendor="Community Hass.io Add-ons"
