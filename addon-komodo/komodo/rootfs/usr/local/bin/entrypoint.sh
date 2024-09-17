#!/bin/bash
set -e

# Log the startup of the service
echo "Starting the Periphery service for Komodo..."

# Ensure the main binary is executable
chmod +x /opt/periphery

# Define the config path for Periphery
CONFIG_PATH="/etc/komodo/periphery.config.toml"

# Check if the configuration file exists
if [ ! -f "$CONFIG_PATH" ]; then
    echo "Configuration file not found at $CONFIG_PATH! Exiting."
    exit 1
fi

# Execute the Periphery service with the necessary config file
exec /opt/periphery --config-path "$CONFIG_PATH"

