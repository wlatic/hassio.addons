#!/usr/bin/env bashio
declare -a options
declare certificate
declare cfconfig

certificate=$(bashio::config 'certificate')
cfconfig=$(bashio::config 'cfconfig')

if ! bashio::fs.file_exists "/config/cf-ha.json"; then
/opt/cloudflared --origincert=${certificate} --cred-file=/config/cf-ha.json tunnel create homeassistant
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

echo -e "tunnel: homeassistant\ncredentials-file: /config/cf-ha.json\n\ningress:\n  - hostname: hause.homenet.house\n     service: http://192.168.5.55:8123\n" > ${cfconfig}

if bashio::config.has_value 'hostname2'; then
    echo -e "  - hostname: ${hostname2}\n    service: ${service2}\n" >> ${cfconfig}
fi

if bashio::config.has_value 'hostname3'; then
    echo -e "  - hostname: ${hostname3}\n    service: ${service3}\n" >> ${cfconfig}
fi

  echo -e "- service: http_status:404" >> ${cfconfig}