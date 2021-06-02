#!/usr/bin/env bashio
declare -a options
declare certificate
certificate=$(bashio::config 'certificate')
cf-cred=$(bashio::config 'cf-cred')

if ! bashio::fs.file_exists '${cf-cred}'; then
   /opt/cloudflared --origincert=${certificate} --cred-file=/config/cf-ha.yml tunnel create homeassistant
fi

declare hostname
declare service
declare hostname2
declare service2
declare hostname3
declare service3

hostname=$(bashio::config 'hostname')
service=$(bashio::config 'service')
hostname2=$(bashio::config 'hostname2')
service2=$(bashio::config 'service2')
hostname3=$(bashio::config 'hostname3')
service3=$(bashio::config 'service3')

echo -e "ingress:\n  - hostname: ${hostname}\n    service: ${service}" > $(cf-cred}

if bashio::config.has_value 'hostname2'; then
    echo -e "  - hostname: ${hostname2}\n    service: ${service2}" >> $(cf-cred}
fi

if bashio::config.has_value 'hostname3'; then
    echo -e "  - hostname: ${hostname3}\n    service: ${service3}" >> $(cf-cred}
fi
