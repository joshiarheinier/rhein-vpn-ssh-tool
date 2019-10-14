#!/bin/bash
DIRPATH=$2
CONFIG=`echo $DIRPATH/config/config-$1.cnf`
CLIENT=`cat $CONFIG | grep client | cut -d'=' -f2`
if [ $CLIENT == "openvpn" ];
then
	PID=`ps aux | grep sbin/openvpn | grep -v grep | awk '{print $2}'`
	sudo kill -9 $PID
	echo "VPN successfully disconnected."
elif [ $CLIENT == "anyconnect" ];
then
	/opt/cisco/anyconnect/bin/vpn disconnect
	echo "VPN successfully disconnected."
else
	echo "Wrong parameter!"
fi

