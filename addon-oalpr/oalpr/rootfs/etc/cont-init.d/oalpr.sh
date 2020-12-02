#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Custom Add-on: Open ALPR
# Configures OPEN ALPR before running
# ==============================================================================
declare port

# Ensure configuration exists
if ! bashio::fs.directory_exists '/config/oalpr/'; then
    mkdir -p /config/oalpr/scripts && \
    mkdir -p /config/oalpr/log && \
    mkdir -p /config/oalpr/data \
        || bashio::exit.nok "Failed to create node-red configuration directory"

    # Copy in template files
    cp /root/oalpr/scripts/oalpr.py /config/oalpr/scripts/
fi
