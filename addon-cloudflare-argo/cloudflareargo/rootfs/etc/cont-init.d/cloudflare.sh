#!/usr/bin/env bashio
declare -a options
declare certificate
declare cfcred

certificate=$(bashio::config 'certificate')
cfcred=$(bashio::config 'cfcred')

if ! bashio::fs.file_exists "${cfcred}"; then
   echo "file not exists ${cfcred}"
   #/opt/cloudflared --origincert=${certificate} --cred-file=${cfcred} tunnel create homeassistant
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

echo -e "credentials-file: /config/cf-ha.yml\ningress:\n  - hostname: ${hostname}\n    service: ${service}" > $(cf-cred}

echo -e "tunnel: homeassistant\ncredentials-file: ${cf-cred}\n\ningress:\n  - hostname: hause.homenet.house\n     service: http://192.168.5.55:8123\n" > ${cf-cred}

if bashio::config.has_value 'hostname2'; then
    echo -e "  - hostname: ${hostname2}\n    service: ${service2}\n" >> $(cf-cred}
fi

if bashio::config.has_value 'hostname3'; then
    echo -e "  - hostname: ${hostname3}\n    service: ${service3}\n  - service: http_status:404" >> ${cf-cred}
fi
