#!/bin/bash
DIRPATH=$2
CONFIG=`echo $DIRPATH/config/config-$1.cnf`
CLIENT=`cat $CONFIG | grep client | cut -d'=' -f2`
if [ $CLIENT == "openvpn" ];
then
	STATUS=`ps aux | grep sbin/openvpn | grep -v grep`
elif [ $CLIENT == "anyconnect" ];
then
	STATUS=`/opt/cisco/anyconnect/bin/vpn state | grep state | head -1 | cut -d':' -f2`
else
	echo "Wrong parameter!"
	exit 1
fi
if [ "$CLIENT$STATUS" == "openvpn" -o "$CLIENT$STATUS" == "anyconnect Disconnected" ];
then
	echo "VPN for $1 is not connected."
else
	echo "$1 env is currently connected using $CLIENT client."
fi
