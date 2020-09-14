#!/bin/bash

sudo apt-get -y update
sudo apt install -y docker.io
sudo apt install -y curl
sudo apt install -y python3-pip
sudo apt install -y nginx
sudo apt install -y certbot
sudo add-apt-repository -y ppa:certbot/certbot
sudo apt-get -y update
sudo apt install -y python-certbot-nginx
# AWS CLI
# sudo apt-get install unzip
# sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
# sudo unzip awscliv2.zip
# sudo ./aws/install
# Terraform
# curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
# sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
# sudo apt-get update && sudo apt-get install terraform