# Community Hass.io Add-ons: CloudFlare Argo

[![Release][release-shield]][release] ![Project Stage][project-stage-shield] ![Project Maintenance][maintenance-shield]

Setup Cloudflare Argo containers with ease!

## About

This is a very hacky setup of Cloudflare argo that helps people access their Home Assistant and other HassOS addons via a public URL.

Cloudflare Argo uses a tunnel and therefore bypasses any need for a NAT'd public IP (LTE connections) or opening firewall ports etc.

## CONFIG

The basic config enables 1 Cloudflare Argo tunnel using:

Hostname (The hostname to pass to Cloudflare)
URL (The local url you want to put online)
Certificate (local path to the Cloudflare Argo Certificate)

The addon supports 3 tunnels using the additional configuration values:
hostname2
url2
certificate2

hostname3
url3
certificate3

If you do not configure tunnel 2 and 3 it will not run.

You'll need to sign up for Argo with Cloudflare directly and generate an SSL certificate at the following url:
https://www.cloudflare.com/a/warp

## Multiple Domains
By default a .pem file from Cloudflare only allows access from a single domain name, if you want multiple domains you'll need multiple .pem files.

Even if you are using the same .pem file for all tunnels you'll need to specify certificate2 and certificate3.
