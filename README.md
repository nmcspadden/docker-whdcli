# docker-whdcli
Docker container for WHD-CLI

To use this container:  

1. Create the com.github.nmcspadden.whd-cli.plist file containing authentication for WebHelpDesk:  
	
		<?xml version="1.0" encoding="UTF-8"?>
		<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
		<plist version="1.0">
		<dict>
		        <key>apikey</key>
		        <string>apikey_generated_from_webhelpdesk</string>
		        <key>whd_url</key>
		        <string>https://webhelpdesk.domain.org:8443</string>
		</dict>
		</plist>
You'll need to generate the [API key](http://www.solarwinds.com/documentation/webhelpdesk/docs/whd_api_12.1.0/web%20help%20desk%20api.html#auth-tech-api-key) for authentication.
2.	This file can either be mounted using -v or configured during build.  A default plist has already been added to the container, so the Dockerfile can easily be forked.
3.	Run the container:  
	`docker run -it --name whdcli -v com.github.nmcspadden.whd-cli.plist:/whdcli/com.github.nmcspadden.whd-cli.plist nmcspadden/whdcli /usr/bin/python`
4.	Inside the container, run Python to use it:  

		>>> import whdcli
		>>> whd_prefs = whdcli.WHDPrefs("/whdcli/com.github.nmcspadden.whd-cli.plist")
		>>> w = whdcli.WHD(whd_prefs, None, None, False)
		>>> w.getDetailedAssetByAttribute('serialNumber','<serial number>', True)
		>>> w.getAssetBySerial("<serial number>")`