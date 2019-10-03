#!/bin/bash
FILEPATH=`which $0`
DIRPATH=`dirname $FILEPATH`
CONFIGPATH=`echo $DIRPATH/config`
IPADDR=`cat ${CONFIGPATH}/ip_list/ip-$1.txt | grep $2 | cut -d':' -f2`
SSHNAME=`cat ${CONFIGPATH}/config-$1.cnf | grep sshname | cut -d'=' -f2`

ssh ${SSHNAME}@${IPADDR}
