#!/bin/bash

ZTD_SERVER_IP="IP address WWW server"
ZTD_PATH=/tftpboot
SZTD_PATH=/sztd
IMAGE_PATH=/osimages
OS_IMAGE=OS10ztd
POSTSCRIPT_PATH=
POSTSCRIPT_FILE=spost_script.sh
CLI_CONF_FILE=scli_config_saved
CLI_CONF_PATH=/cli_config
APP="http://"

IMG_FILE="${APP}${ZTD_SERVER_IP}${ZTD_PATH}${SZTD_PATH}${IMAGE_PATH}/${OS_IMAGE}"

CLI_CONFIG_FILE="${APP}${ZTD_SERVER_IP}${ZTD_PATH}${SZTD_PATH}${CLI_CONF_PATH}/${CLI_CONF_FILE}"

#POST_SCRIPT_FILE="${APP}${ZTD_SERVER_IP}${ZTD_PATH}${SZTD_PATH}${POSTSCRIPT_PATH}/${POSTSCRIPT_FILE}"

echo $IMG_FILE

################### DO NOT MODIFY THE LINES BELOW ##################
sudo os10_ztd_start.sh "$IMG_FILE" "$CLI_CONFIG_FILE" "$POST_SCRIPT_FILE"
############################# **END** #################################

