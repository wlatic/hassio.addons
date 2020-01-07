#!/usr/bin/with-contenv bashio
declare hostname
declare haurl

hostname=$(bashio::config 'hostname')
haurl=$(bashio::config 'haurl')

echo -e "hostname: ${hostname}\nurl: ${haurl}" > /etc/cloudflared/config.yml
