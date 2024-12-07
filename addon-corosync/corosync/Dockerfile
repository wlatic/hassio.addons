ARG BUILD_FROM
FROM ${BUILD_FROM}

USER root
RUN mkdir -p /etc/corosync/qnetd/nssdb

USER 903:903

LABEL \
    io.hass.name="Corosync QNetd" \
    io.hass.description="Corosync Quorum Network Daemon for Home Assistant" \
    io.hass.type="addon" \
    io.hass.version="dev" \
    io.hass.arch="${BUILD_ARCH}"
