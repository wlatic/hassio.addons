ARG BUILD_FROM
FROM $BUILD_FROM

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Setup architecture-specific binaries
ARG BUILD_ARCH
RUN \
  ARCH="${BUILD_ARCH}" \
  && if [[ "${BUILD_ARCH}" = "aarch64" ]]; then ARCH="arm64"; fi \
  && if [[ "${BUILD_ARCH}" = "amd64" ]]; then ARCH="amd64"; fi \
  && echo "Building for ${ARCH}" \
  && mkdir /etc/komodo \
  && curl -L -s -o /opt/periphery "https://github.com/mbecker20/periphery/releases/download/latest/periphery-linux-${ARCH}" \
  && chmod +x /opt/periphery

# Copy application files
COPY rootfs /

CMD ["/opt/periphery"]
