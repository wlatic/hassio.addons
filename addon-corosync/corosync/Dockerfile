ARG BUILD_FROM
FROM ${BUILD_FROM}

# Create directory and set permissions before the container starts
RUN mkdir -p /etc/corosync/qnetd/nssdb && \
    chmod -R 755 /etc/corosync

LABEL \
    io.hass.name="Corosync QNetd" \
    io.hass.description="Corosync Quorum Network Daemon for Home Assistant" \
    io.hass.type="addon" \
    io.hass.version="dev" \
    io.hass.arch="${BUILD_ARCH}"
