#!/bin/bash
pushd `dirname $0` > /dev/null
BASEDIR=`pwd`
popd > /dev/null

HTTPFS_HOST=114.202.246.206:14000
PACKAGE_PATH=dev_nexus

MODULE_NAME=jet_ansible.tar.gz

mkdir -p ${BASEDIR}/../target

cd ${BASEDIR}/..

tar cvfz target/${MODULE_NAME} --exclude target --exclude test *

curl -X PUT "http://${HTTPFS_HOST}/webhdfs/v1/${PACKAGE_PATH}/${MODULE_NAME}?op=create&overwrite=true&data=true&user.name=hdfs" -T target/${MODULE_NAME} --header "content-type:application/octet-stream"
