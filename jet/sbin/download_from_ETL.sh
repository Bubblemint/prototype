#!/bin/bash
pushd `dirname $0` > /dev/null
BASEDIR=`pwd`
popd > /dev/null

HTTPFS_HOST=114.202.246.206:14000
PACKAGE_PATH=dev_nexus

MODULE_NAME=jet_ansible.tar.gz

TARGET_DIR=${BASEDIR}/../target
mkdir -p ${TARGET_DIR}
rm -rf ${TARGET_DIR}/*

curl "http://${HTTPFS_HOST}/webhdfs/v1/${PACKAGE_PATH}/${MODULE_NAME}?op=open&user.name=memex" > ${TARGET_DIR}/${MODULE_NAME}

if [ -z "`file ${TARGET_DIR}/${MODULE_NAME} | grep ASCII`" ];
then
  cd ${TARGET_DIR}
  tar xvfz ${MODULE_NAME} 
  rm -rf ${MODULE_NAME}
  rsync -av * ../ --exclude=".*"
else
  rm -rf ${TARGET_DIR}/${MODULE_NAME}
  echo "FAILED"
  exit 1
fi
