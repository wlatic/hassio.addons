#!/usr/bin/with-contenv bashio
declare hostname
declare haurl
declare hostname2
declare haurl2
declare hostname3
declare haur3

hostname=$(bashio::config 'hostname')
haurl=$(bashio::config 'haurl')
hostname2=$(bashio::config 'hostname2')
haurl2=$(bashio::config 'haurl2')
hostname3=$(bashio::config 'hostname3')
haurl3=$(bashio::config 'haurl3')
 
echo -e "hostname: ${hostname}\nurl: ${haurl}" > /etc/cloudflared/1.yml

if bashio::config.has_value 'hostname2'; then
    echo -e "hostname: ${hostname2}\nurl: ${haurl2}" > /etc/cloudflared/2.yml
fi

if bashio::config.has_value 'hostname3'; then
    echo -e "hostname: ${hostname3}\nurl: ${haurl3}" > /etc/cloudflared/3.yml
fi
