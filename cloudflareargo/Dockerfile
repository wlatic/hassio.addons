ARG BUILD_FROM=hassioaddons/ubuntu-base:4.0.3
# hadolint ignore=DL3006
FROM ${BUILD_FROM}
# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

#!/usr/bin/with-contenv bashio
# Setup base system
ARG BUILD_ARCH=amd64
#RUN \
#    apk add --no-cache --virtual  jq
RUN mkdir /etc/cloudflared 
COPY rootfs /


RUN \
 ARCH="${BUILD_ARCH}" \
 && if [[ "${BUILD_ARCH}" = "aarch64" ]]; then ARCH="arm"; fi \
 && if [[ "${BUILD_ARCH}" = "amd64" ]]; then ARCH="amd64"; fi \
 && if [[ "${BUILD_ARCH}" = "armhf" ]]; then ARCH="arm"; fi \
 && if [[ "${BUILD_ARCH}" = "armv7" ]]; then ARCH="arm"; fi \
 && if [[ "${BUILD_ARCH}" = "i386" ]]; then ARCH="386"; fi \
 && curl https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-${ARCH}.tgz --output cloudflared.tgz
 
 Run \
 tar xzf cloudflared.tgz 
 
 Run \
 chmod +x cloudflared \
 && mv cloudflared /opt/cloudflared \
 && rm -f cloudflared.tgz
 
RUN \
 curl http://hassio:8123/local/cert.pem --output cert.pem \
 && mv cert.pem /etc/cloudflared/cert.pem

CMD /opt/cloudflared

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
    maintainer="James" \
    org.label-schema.description="Argo Cloudflare Proxy" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="ArgoCloudflare" \
    org.label-schema.schema-version="0.1" \
    org.label-schema.url="" \
    org.label-schema.usage="" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/wlatic/hassio.addons" \
    org.label-schema.vendor="Community Hass.io Add-ons"
