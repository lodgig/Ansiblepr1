#!/bin/bash
# This file should be sourced

# Change directory to user home
cd /home/ansibleadmin

# Upgrade all packages that have available updates and remove old ones.
sudo apt-get update
sudo apt upgrade -y
sudo apt autoremove --assume-yes

# Install git
sudo apt install git --assume-yes

# Install azcli
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install jenkins
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt install jenkins


# Install venv and pip
sudo apt install python3-venv --assume-yes
sudo apt install python3-pip --assume-yes

# Setup virtual environment and push home folder ownership
sudo python3 -m venv venv
sudo chown ansibleadmin /home/ansibleadmin --recursive

# Install ansible and azure modules into virtual environment
pip3 install -r https://raw.githubusercontent.com/lodgig/Ansiblepr1/master/requirements-ansible.txt
pip3 install -r https://raw.githubusercontent.com/lodgig/Ansiblepr1/master/requirements-azure.txt