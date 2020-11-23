#!/bin/bash

ZTD_SERVER_IP="IP address WWW server"
MAC_ADDRESS=`clish -c "show system | grep mac|MAC.*:.*:" | awk '{print $NF}'`
FILE_FRIENDLY_MAC_ADDRESS=`echo ${MAC_ADDRESS} | sed 's/:/_/g'`
CONFIG_PATH=tftpboot/sztd/cli_config
CONFIG_FILE=${FILE_FRIENDLY_MAC_ADDRESS}.OS10.config
APP=http://

clish -c "copy ${APP}${ZTD_SERVER_IP}/${CONFIG_PATH}/${CONFIG_FILE} running-configuration"

