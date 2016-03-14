#!/bin/bash
ANSIBLE_HOME=/app/memex/cosmos/jet/env/ansible
PYTHON_HOME=/app/memex/cosmos/jet/env/python

export PATH=${ANSIBLE_HOME}/bin:${PYTHON_HOME}/bin:${PATH}
export PYTHONPATH=${ANSIBLE_HOME}/lib:${PYTHON_HOME}/lib/python2.7/site-packages
