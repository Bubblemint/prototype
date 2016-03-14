#!/bin/bash
HTTPFS_HOST=114.202.246.206:14000
PACKAGE_PATH=cosmos_packages

BASE_DIR=$1
MODULE_NAME=$2
DEST=$3

curl "http://${HTTPFS_HOST}/webhdfs/v1/${PACKAGE_PATH}/${BASE_DIR}/${MODULE_NAME}?op=open&user.name=memex" > ${DEST}/${MODULE_NAME} 

if [ -z "`file ${DEST}/${MODULE_NAME} | grep ASCII`" ];
then
  exit 0 
else
  rm -rf ${DEST}/${MODULE_NAME}
  echo "FAILED"
  exit 1
fi
