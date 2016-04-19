#!/bin/bash

# Update the box
apt-get update
apt-get -y install python-dev python-crypto python-pip
pip install paramiko PyYAML Jinja2 httplib2 six
pip install ansible
ansible --version
