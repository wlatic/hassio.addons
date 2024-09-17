#!/bin/bash
set -e

# Log the startup of the service
echo "Starting the Periphery service for Komodo..."

# Ensure the main binary is executable
chmod +x /opt/periphery

# If needed, any environment variables or initial setup can go here.
# Example of checking if a config exists, you could adapt this to your specific use case:
if [ ! -f /etc/komodo/config.yaml ]; then
    echo "Configuration file not found! Exiting."
    exit 1
fi

# Run the Periphery service with any additional arguments
exec /opt/periphery "$@"
