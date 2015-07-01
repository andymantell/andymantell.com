#!/usr/bin/env bash

# Install dependencies
sudo apt-get update
sudo apt-get install -y apache2 xsltproc git build-essential

# Install node
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh | bash
. ~/.nvm/nvm.sh
nvm install stable

# Set up Apache to serve our dist folder
sudo rm -rf /var/www/html
mkdir -p /vagrant/dist
sudo ln -fs /vagrant/dist /var/www/html

# Configure apache
sudo a2enmod rewrite
sudo service apache2 restart

# Install grunt-cli
npm install grunt-cli -g

# Navigate to the project and install node dependencies
cd /vagrant
sudo rm -rf node_modules
npm install
