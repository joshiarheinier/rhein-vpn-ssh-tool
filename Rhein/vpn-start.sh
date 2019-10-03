#!/bin/bash
FILEPATH=`which $0`
DIRPATH=`dirname $FILEPATH`
CONFIG=`echo $DIRPATH/config/config-$1.cnf`
CLIENT=`cat $CONFIG | grep client | cut -d'=' -f2`
if [ $CLIENT == anyconnect ];
then
	USERNAME=`cat $CONFIG | grep username | cut -d'=' -f2`
	PWD=`cat $CONFIG | grep pwd | cut -d'=' -f2`
        ADDR=`cat $CONFIG | grep addr | cut -d'=' -f2`
        PROFILE=`cat $CONFIG | grep profile | cut -d'=' -f2`
        anyconnect-vpn.sh $ADDR $USERNAME $PWD $PROFILE
elif [ $CLIENT == openvpn ];
then
	OVPNPATH=`echo $DIRPATH/ovpn_profile`
	USERNAME=`cat $CONFIG | grep username | cut -d'=' -f2`
	PWD=`cat $CONFIG | grep pwd | cut -d'=' -f2`
        OVPNFILE=`cat $CONFIG | grep ovpnfile | cut -d'=' -f2`
        sudo open-vpn.sh ${OVPNPATH}/${OVPNFILE} $USERNAME $PWD
fi
