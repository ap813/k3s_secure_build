#!/usr/bin/bash

sudo dnf update -y

python3 --version 2> /dev/null

if [ $? -eq 0 ]
then
  echo "python3 already installed"
else
  echo "Need to install python3" >&2
  sudo dnf install python3 -y
fi

pip3 --version 2> /dev/null

if [ $? -eq 0 ]
then
  echo "pip3 already installed"
else
  echo "Need to install pip3" >&2
  sudo dnf install python3-pip -y
fi

ansible --version 2> /dev/null

if [ $? -eq 0 ]
then
  echo "ansible already installed"
else
  echo "Need to install ansible" >&2
  pip3 install ansible --user
fi

ansible --version

ansible-galaxy collection install community.kubernetes
