# Community Hass.io Add-ons: CloudFlare Argo

Setup Cloudflare Argo containers with ease!


![Project Stage][project-stage-shield]
[![License][license-shield]](LICENSE.md)

![Supports aarch64 Architecture][aarch64-shield]
![Supports amd64 Architecture][amd64-shield]
![Supports armhf Architecture][armhf-shield]
![Supports armv7 Architecture][armv7-shield]
![Supports i386 Architecture][i386-shield]

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

## Home Assistant Config
As of the newest updates HA also needs to be told to allow proxies, the following is an example of what should be added to your config to avoid 400: bad request issues

```
http:
  trusted_proxies: 172.30.32.0/23
  use_x_forwarded_for: true
```

## Multiple Domains
By default a .pem file from Cloudflare only allows access from a single domain name, if you want multiple domains you'll need multiple .pem files.

Even if you are using the same .pem file for all tunnels you'll need to specify certificate2 and certificate3.

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[commits]: https://github.com/wlatic/hassio.addons/addon-cloudflare-argo/commits/master
[contributors]: https://github.com/wlatic/hassio.addons/addon-cloudflare-argo/graphs/contributors
[forum-shield]: https://img.shields.io/badge/community-forum-brightgreen.svg
[frenck]: https://github.com/wlatic
[gitlabci]: https://gitlab.com/wlatic/hassio.addons/addon-cloudflare-argo/pipelines
[home-assistant]: https://home-assistant.io
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[issue]: https://github.com/wlatic/hassio.addons/addon-cloudflare-argo/issues
[keepchangelog]: http://keepachangelog.com/en/1.0.0/
[license-shield]: https://img.shields.io/github/license/hassio-addons/addon-vscode.svg
[maintenance-shield]: https://img.shields.io/maintenance/yes/2020.svg
[project-stage-shield]: https://img.shields.io/badge/Project%20Stage-Development-yellowgreen.svg
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/wlatic/hassio.addons/addon-cloudflare-argo/releases
[repository]: https://github.com/wlatic/hassio.addons/repository
[semver]: http://semver.org/spec/v2.0.0.htm
[ubuntu-packages]: https://packages.ubuntu.com
