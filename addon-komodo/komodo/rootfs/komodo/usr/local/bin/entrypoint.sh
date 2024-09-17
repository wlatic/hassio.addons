#!/bin/bash
set -e

# Log the startup of the service
echo "Starting the Periphery service for Komodo..."

# Ensure the binary is executable
chmod +x /opt/periphery

# Check for configuration file or any other setup (if needed)
if [ ! -f /etc/komodo/config.yaml ]; then
    echo "Configuration file not found! Exiting."
    exit 1
fi

# Execute the Periphery service without passing any unnecessary arguments
exec /opt/periphery

