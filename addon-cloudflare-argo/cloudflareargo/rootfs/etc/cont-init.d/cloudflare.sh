#!/usr/bin/env bashio
declare -a options
declare certificate
certificate=$(bashio::config 'certificate')
cf-cred=$(bashio::config 'cf-cred')

if ! bashio::fs.file_exists '${cf-cred}'; then
   /opt/cloudflared --origincert=${certificate} --cred-file=/config/cf-cred.json tunnel create homeassistant
fi
