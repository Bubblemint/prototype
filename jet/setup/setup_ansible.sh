#!/bin/bash
pushd `dirname $0` > /dev/null
BASEDIR=`pwd`
popd > /dev/null

ANSIBLE_VERSION=2.0.0.1
ANSIBLE_PACKAGE_NAME=ansible-${ANSIBLE_VERSION}
ANSIBLE_PACKAGE_ZIP_NAME=${ANSIBLE_PACKAGE_NAME}.tar.gz
ANSIBLE_INSTALL_PATH=/app/memex/cosmos/package
JET_HOME=/app/memex/cosmos/jet

mkdir -p ${ANSIBLE_INSTALL_PATH}
${BASEDIR}/roles/download/files/download_from_ETL.sh ansible ${ANSIBLE_PACKAGE_ZIP_NAME} ${BASEDIR} 

tar xzf ${BASEDIR}/${ANSIBLE_PACKAGE_ZIP_NAME}
mv ${BASEDIR}/${ANSIBLE_PACKAGE_NAME} ${ANSIBLE_INSTALL_PATH}/
ln -s ${ANSIBLE_INSTALL_PATH}/${ANSIBLE_PACKAGE_NAME} ${JET_HOME}/env/ansible
rm ${BASEDIR}/${ANSIBLE_PACKAGE_ZIP_NAME}
