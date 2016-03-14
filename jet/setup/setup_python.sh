#!/bin/bash
pushd `dirname $0` > /dev/null
BASEDIR=`pwd`
popd > /dev/null

PYTHON_VERSION=2.7.9
PYTHON_DIST_PACKAGE_NAME=python-${PYTHON_VERSION}
PYTHON_PACKAGE_NAME=python-${PYTHON_VERSION}_for_ansible
PYTHON_PACKAGE_ZIP_NAME=${PYTHON_PACKAGE_NAME}.tar.gz
PYTHON_INSTALL_PATH=/app/memex/cosmos/package
JET_HOME=/app/memex/cosmos/jet

mkdir -p ${PYTHON_INSTALL_PATH}
${BASEDIR}/roles/download/files/download_from_ETL.sh ansible ${PYTHON_PACKAGE_ZIP_NAME} ${BASEDIR} 

mkdir -p ${JET_HOME}/env
tar xzf ${BASEDIR}/${PYTHON_PACKAGE_ZIP_NAME}
mv ${BASEDIR}/${PYTHON_DIST_PACKAGE_NAME} ${PYTHON_INSTALL_PATH}/
ln -s ${PYTHON_INSTALL_PATH}/${PYTHON_DIST_PACKAGE_NAME} ${JET_HOME}/env/python
rm ${BASEDIR}/${PYTHON_PACKAGE_ZIP_NAME}
