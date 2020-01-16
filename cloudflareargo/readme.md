This addon is designed for HASSOS and allows you to run 3 different CloudFlare Argo tunnels.

You'll need to download a certificate from your Cloudflare account via https://www.cloudflare.com/a/warp

Once that has been done place it into your /config/www folder and rename it to argo.pem

The initial config has hostname and haurl, however there is also hostname2/haurl2 and hostname3/haurl3 availble to use:

  "hostname": "sub.domain.com",
  "haurl": "http://hostname:8123",
  "hostname2": "sub2.domain.com",
  "haurl2": "http://hostname:8443",
  "hostname3": "sub3.domain.com",
  "haurl3": "http://hostname:8080"

If you are not using hostname2 and hostname3 make sure to remove them from your config so that the two argo tunnels are not trying to spin up!

