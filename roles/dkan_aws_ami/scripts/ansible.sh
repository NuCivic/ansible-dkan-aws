#!/bin/bash

# Add Ansible on Debian
#apt-get update
#apt-get -y install python-dev python-crypto python-pip libffi-dev libssl-dev
#pip install paramiko PyYAML Jinja2 httplib2 six
#pip install ansible
#ansible --version

# Add Ansible on Centos
# yum install python-setuptools python-setuptools-devel
# easy_install pip

yum -y install epel-release libffi-devel python-devel openssl-devel gcc
yum -y install python-pip
pip install paramiko PyYAML Jinja2 httplib2 six
pip install ansible
ansible --version
