#!/bin/bash

ZTD_ALWAYS=true
ZTD_SERVER_IP="IP address WWW server"
ZTD_PATH=/tftpboot
SZTD_PATH=/sztd
RELOAD_SCRIPT=reload-ztd
IMAGE_PATH=/osimages
OS_IMAGE=OS10ztd
POSTSCRIPT_PATH=
POSTSCRIPT_FILE=spost_script.sh
CLI_CONF_FILE=scli_config_saved
CLI_CONF_PATH=/cli_config
APP="http://"
RELOAD_ZTD=/etc/init.d/${RELOAD_SCRIPT}
RELOAD_ZTD_LN=/etc/rc5.d/S99${RELOAD_SCRIPT}

#IMG_FILE="${APP}${ZTD_SERVER_IP}${ZTD_PATH}${SZTD_PATH}${IMAGE_PATH}/${OS_IMAGE}"
#CLI_CONFIG_FILE="${APP}${ZTD_SERVER_IP}${ZTD_PATH}${SZTD_PATH}${CLI_CONF_PATH}/${CLI_CONF_FILE}"
POST_SCRIPT_FILE="${APP}${ZTD_SERVER_IP}${ZTD_PATH}${SZTD_PATH}${POSTSCRIPT_PATH}/${POSTSCRIPT_FILE}"

echo $IMG_FILE

################### DO NOT MODIFY THE LINES BELOW ##################
sudo os10_ztd_start.sh "$IMG_FILE" "$CLI_CONFIG_FILE" "$POST_SCRIPT_FILE"
############################# **END** #################################

if [[ ${ZTD_ALWAYS} == "true" ]] ||\
   [[ ${ZTD_ALWAYS} == "True" ]] ||\
   [[ ${ZTD_ALWAYS} == "TRUE" ]] ||\
   [[ ${ZTD_ALWAYS} == "1" ]] ||\
   [[ ${ZTD_ALWAYS} == "yes" ]] ||\
   [[ ${ZTD_ALWAYS} == "YES" ]] ||\
   [[ ${ZTD_ALWAYS} == "Yes" ]] ||\
   [[ ${ZTD_ALWAYS} == "Y" ]];

   then
	   echo "Will make sure ZTD staging is done at next startup!";
	   if [ ! -f ${RELOAD_ZTD} ]; then

		curl -o ${RELOAD_ZTD} ${APP}${ZTD_SERVER_IP}${ZTD_PATH}${SZTD_PATH}/${RELOAD_SCRIPT}
		chmod 755 ${RELOAD_ZTD}

	   fi

	   if [ ! -f ${RELOAD_ZTD_LN} ]; then

		ln -s ${RELOAD_ZTD} ${RELOAD_ZTD_LN}
	   fi

   else
	   echo "Disable automatic ZTD staging!";
	   test -f ${RELOAD_ZTD_LN} && rm -f ${RELOAD_ZTD_LN}

fi

