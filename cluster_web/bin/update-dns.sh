#!/bin/bash
#
# Author: Re4mstr
#
# Purpose:
# Check for updated WAN address
# then update nsupdate.info
#
# VARIABLES:
HOSTNAME="HOSTNAME" #(example.nsupdate.info)
SECRET="SECRET"
UPDATE_URL=https://$HOSTNAME:$SECRET@ipv4.nsupdate.info/nic/update
#
# Check current IP:
CURRENT_IP=$(wget https://ipv4.nsupdate.info/myip -q -O -)
#
# Check dns ip records:
DNS_IP=$(dig +short $HOSTNAME)
#
# DEBUG:
echo $CURRENT_IP - Current
echo $DNS_IP - Server
#
# Compare the IPs:
if [ $DNS_IP != $CURRENT_IP ]
then
        wget -q -O - $UPDATE_URL
fi
