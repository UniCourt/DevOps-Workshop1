#!/bin/bash

declare -r PIPLIBS=(
    "ansible==2.9.11"
    "awscli==1.18.47"
    "colorama==0.3.7"
    "boto3==1.14.20"
)
declare -r ANSIBLE_PACKAGE=

installing_pip() {
    sudo apt-get install python3-pip python3-setuptools -y
}

installing_piplibs() {
    # Install all the specified pip libs
    for pip_package in "${PIPLIBS[@]}"; do
        sudo python3 -m pip install $pip_package
    done
}

set_ansible_cfg() {
    ANSIBLE_PATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
    ANSIBLE_CONFIG="[defaults]\nroles_path = ${ANSIBLE_PATH}/roles\ninventory = ${ANSIBLE_PATH}/inventory\n"
    # Creating the /etc/ansible folder
    sudo mkdir -p /etc/ansible
    # Generating the cfg file
    sudo echo -e $ANSIBLE_CONFIG > /etc/ansible/ansible.cfg
}

installing_pip
installing_piplibs
set_ansible_cfg