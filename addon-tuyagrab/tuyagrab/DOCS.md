Once you've set this addon up, you can access: config/tuyadevices.txt

It shows you all your Tuya account devices and their keys! Getting there is a little bit less simple, but still easy.


# How to get Tuya API Credentials

Tuya has an [official document](https://developer.tuya.com/en/docs/iot/open-api/quick-start/quick-start1) if you'd prefer that instead.  I've tried to give a real short and simple guide below.

### Set up your developer account
- Add your devices to the Smart Life or Tuya App on phone.

- Register for a [Tuya developer account](https://iot.tuya.com).

### Add your devices to your account
- Click Cloud > Projects > Create. The name, description and industry fields don't matter.

- You can now click the name of the project you just setup and you'll see the following info:

Access ID = TuyaKey<br />
Access Secret = Tuyasecret

- Next Click Cloud > Link Devices > Link Devices By App Account > Add App account (this will show a barcode on screen)

- Within whatever Tuya app you use, click "Me" at the bottom right of the screen and then the icon on the top right (it's a camera icon), and then scan the barcode.

- You'll see the newly added line and within the Device Quantity you'll have the total number devices in your Tuya account, click the number.

### Set a couple of last things up
- The next screen you'll need to select the region (China, Europe, India, America) your devices are set up under (if you don't know, try them all).

Region = tuyaregion

(China = cn, Europe = eu, India = in, America = us)

- From the devices screen you'll also need to grab a device ID. This is the long string of characters under a devices name.

Device ID = tuyadevice

- One last thing to do inside Tuya IOT.

Click Cloud > API groups

On the following items you need to click Apply, enter a reason and click ok. Big warning on this part, **it can take 10-15 minutes to update**, so if you have issues always wait that time period before doing ANYTHING ELSE!

"Authorization Management"
"Device Management"
"Device Control"
"User Management"
"Network Management"
"Data Service"
"Device Statistics"

### Time to fill out the addon config!
You can now fill out the configuration using:

Device ID = tuyadevice
Access ID = tuyaKey
Access Secret = tuyasecret
Region = tuyaregion

Once you've input them save and you can then start the app.

Please note you only need to run this addon when you are looking for a device key, it will gather the devices every 5 minutes and you can click <a href="/local/tuyadevices.txt" target="_blank">this link</a> to browse through all of your device ids and keys!

Once setup all you'll need to do is add the device to your Tuya/Smart Life app, run this addon, stop the addon and check the file generated.

# Extras

You can also use a sensor to show the file:

```
sensor:
  - platform: command_line
    command: cat /config/www/tuyadevices.txt
```
