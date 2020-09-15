#!/bin/bash

if [ "$LOGGING" = "true" ] || [ "$LOGGING" = "TRUE" ]; then
  echo "Starting Rebooting Script"
fi

location="/upnp/control/deviceconfig"
uri="urn:dslforum-org:service:DeviceConfig:1"
action='Reboot'
IFS='|' read -r -a ipsArray <<< "$FRITZ_IPS"

for index in "${!ipsArray[@]}"
do
  if [ "$LOGGING" = "true" ] || [ "$LOGGING" = "TRUE" ]; then
    echo "Started reboot for ${ipsArray[index]}"
    curl -k -m 5 --anyauth -u "$FRITZ_USER:$FRITZ_PW" http://${ipsArray[index]}:49000$location -H 'Content-Type: text/xml; charset="utf-8"' -H "SoapAction:$uri#$action" -d "<?xml version='1.0' encoding='utf-8'?><s:Envelope s:encodingStyle='http://schemas.xmlsoap.org/soap/encoding/' xmlns:s='http://schemas.xmlsoap.org/soap/envelope/'><s:Body><u:$action xmlns:u='$uri'></u:$action></s:Body></s:Envelope>" -s > /var/log/fritzbox/reboot.log
  else
    curl -k -m 5 --anyauth -u "$FRITZ_USER:$FRITZ_PW" http://${ipsArray[index]}:49000$location -H 'Content-Type: text/xml; charset="utf-8"' -H "SoapAction:$uri#$action" -d "<?xml version='1.0' encoding='utf-8'?><s:Envelope s:encodingStyle='http://schemas.xmlsoap.org/soap/encoding/' xmlns:s='http://schemas.xmlsoap.org/soap/envelope/'><s:Body><u:$action xmlns:u='$uri'></u:$action></s:Body></s:Envelope>" -s > /dev/null
  fi
done
