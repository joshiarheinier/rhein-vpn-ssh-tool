if [ $1 == "stg" ];
then
	PID=`ps aux | grep sbin/openvpn | grep -v grep | awk '{print $2}'`
	sudo kill -9 $PID
	echo "VPN successfully disconnected."
elif [ $1 == "dev" ] || [ $1 == "prod" ];
then
	/opt/cisco/anyconnect/bin/vpn disconnect
	echo "VPN successfully disconnected."
else
	echo "Wrong parameter!"
fi

