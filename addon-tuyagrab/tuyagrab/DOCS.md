The End result of this addon is your devices are output to the log of this Addon. It also creates a text file within config called tuyadevices.txt

To open logs in a new tab click <a href="../logs" target="_blank">here</a>

It shows you all your Tuya account devices!!! Getting there is a little bit less simple.


-- How to get Tuya API Credentials -- 

Tuya has the following document: https://developer.tuya.com/en/docs/iot/open-api/quick-start/quick-start1?id=K95ztz9u9t89n I've tried to give a real short and simple guide below.

Add your devices to the Smart Life or Tuya App on phone.

Register on <a href="https://iot.tuya.com">iot.tuya.com</a>

Click Cloud > Projects > Create You can use any name, description and Industry

You can now click the name of the project you just setup and you'll see the following info:

Access ID = TuyaKey
Access Secret = Tuyasecret

Next Click Cloud > Link Devices > Link Devices By App Account > Add App account (this will show a barcode on screen)

Within your smart life or Tuya app, click "Me" at the bottom right of the screen and then the icon on the top right (its a camera Icon), you can then scan the barcode.

You'll see the newly added line and within the Device Quantity you'll have the total number devices in your Tuya account, click the number.

The next screen you'll need to select the region (China, Europe, India, America) your devices are recorded under (if you dont know try them all).

Region = tuyaregion

(China = cn, Europe = eu, India = in, America = us)

From the devices screen you'll also need to grab a device ID. This is the long string of characters under a devices name.

Device ID = tuyadevice

One last thing to do inside Tuya IOT.

Click Cloud > API groups

On the following items you need to click Apply, enter a reason and click ok. Big warning on this part, it can take 10-15 minutes to update, so if you have issues always wait that time period before doing ANYTHING ELSE!

"Authorization Management"
"Device Management"
"Device Control"
"User Management"
"Network Management"
"Data Service"
"Device Statistics"

You can now fill out the configuration using:

Device ID = tuyadevice
Access ID = tuyaKey
Access Secret = tuyasecret
Region = tuyaregion

Once you've input them save and you can then start the app.

Please note you only need to run this addon when you are looking for a device key, it will gather the devices every 5 minutes and you can click the link at the top of this document to browse through all of your device ids and keys!

Once setup all you'll need to do is add the device to your Tuya/Smart Life app, run this addon, stop the addon and check the file generated.

-- Extras -- 

You can also use a sensor to show the file:

sensor:
  - platform: command_line
    command: cat /config/www/tuyadevices.txt
