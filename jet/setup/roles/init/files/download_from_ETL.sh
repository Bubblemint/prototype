#!/bin/bash
HTTPFS_HOST=114.202.246.206:14000
PACKAGE_PATH=cosmos_packages

MODULE_NAME=$1
DEST=$2

curl "http://${HTTPFS_HOST}/webhdfs/v1/${PACKAGE_PATH}/$1?op=open&user.name=memex" > $2/$1 

if [ -z "`file $2/$1 | grep ASCII`" ];
then
  exit 0 
else
  rm -rf $2/$1
  echo "FAILED"
  exit 1
fi
