#!/bin/bash
TARGET=$1
pushd `dirname $0` > /dev/null
BASEDIR=`pwd`
popd > /dev/null
export PYTHONPATH="/app/memex/cosmos/jet/env/ansible/lib:"

source ./env.sh

case ${TARGET} in
    "all")
	PLAYBOOK=jet.yml
	;;
    *)
	PLAYBOOK=playbooks/${TARGET}.yml
	;;
esac

shift
ansible-playbook ${PLAYBOOK} -i hosts -e ANSIBLE_BASE_DIR=${BASEDIR} -e COSMOS_PATH=/app/memex/cosmos --vault-password-file ~/.vault_pass.txt -f 20 $@
