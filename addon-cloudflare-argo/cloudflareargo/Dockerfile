ARG BUILD_FROM=hassioaddons/base:8.0.6
FROM $BUILD_FROM

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Setup base
# hadolint ignore=DL3003
ARG BUILD_ARCH=amd64
RUN \
 ARCH="${BUILD_ARCH}" \
 && if [[ "${BUILD_ARCH}" = "aarch64" ]]; then ARCH="arm64"; fi \
    && if [[ "${BUILD_ARCH}" = "amd64" ]]; then ARCH="amd64"; fi \
    && if [[ "${BUILD_ARCH}" = "armhf" ]]; then ARCH="arm"; fi \
    && if [[ "${BUILD_ARCH}" = "armv7" ]]; then ARCH="arm"; fi \
    && if [[ "${BUILD_ARCH}" = "i386" ]]; then ARCH="386"; fi \

&& apk add libc6-compat \

# Old Code && if [[ "$ARCH" = "arm64" ]]; then mkdir /etc/cloudflared && curl -L -s -o /opt/cloudflared "https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64" && chmod +x /opt/cloudflared; else mkdir /etc/cloudflared && curl -L -s "https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-${ARCH}.tgz" | tar xzf - -C /opt/ && chmod +x /opt/cloudflared;  fi 

&& mkdir /etc/cloudflared && curl -L -s -o /opt/cloudflared "https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-${ARCH}" && chmod +x /opt/cloudflared 

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
    org.label-schema.schema-version="1.1" \
    org.label-schema.url="" \
    org.label-schema.usage="https://github.com/wlatic/hassio.addons/tree/master/addon-cloudflare-argo/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/wlatic/docker-cloudflare-argo" \
    org.label-schema.vendor="Community Hass.io Add-ons"
