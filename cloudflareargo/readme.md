This addon is designed for HASSOS and allows you to run 3 different CloudFlare Argo tunnels.

You'll need to download a certificate from your Cloudflare account via https://www.cloudflare.com/a/warp

Place the certificate into your /config folder (ideally within a sub folder) and you can then define this within the config.

The initial config has hostname and haurl, however there is also hostname2/haurl2 and hostname3/haurl3 availble to use:

  "hostname": "sub.domain.com",
  "url": "http://hostname:8123",
  "certificate": "/config/ssl/argo.pem",
  "hostname2": "sub2.domain.com",
  "url2": "http://hostname:8443",
  "certificate2": "/config/ssl/argo.pem",
  "hostname3": "sub3.domain.com",
  "url3": "http://hostname:8080"
  "certificate3": "/config/ssl/argo.pem",

If you are not using hostname2 and hostname3 make sure to remove them from your config so that the two argo tunnels are not trying to spin up!

A pause of 30 seconds happens on tunnel1, 35 seconds on tunnel2 and 40 seconds on tunnel3, to ensure your urls are online by the time it spins up.
