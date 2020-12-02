#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Custom Add-on: Open ALPR
# Configures OPEN ALPR before running
# ==============================================================================
declare port

# Ensure configuration exists
if ! bashio::fs.directory_exists '/config/oalpr/'; then
    mkdir -p /config/oalpr/data && \
    mkdir -p /config/oalpr/scripts && \
    mkdir -p /config/oalpr/log \
        || bashio::exit.nok "Failed to create node-red configuration directory"

    # Copy in template files
    cp /root/oalpr/scripts/oalpr.py /config/oalpr/

fi
    ln -s /root/oalpr/log /config/oalpr/log
    ln -s /root/oalpr/data /config/oalpr/data
