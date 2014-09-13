#!/usr/bin/env bash

# Install dependencies
sudo apt-get update
sudo apt-get install -y apache2 xsltproc ruby-full build-essential libssl-dev nodejs-legacy npm


# Installing nodejs
#sudo su vagrant -c "wget -qO- https://raw.github.com/creationix/nvm/master/install.sh | sh"
#source ~/.profile
#nvm install 0.11.13
#sudo apt-get install -y npm

# Set up Apache to serve our dist folder
sudo rm -rf /var/www/html
sudo ln -fs /vagrant/dist /var/www/html

# Install grunt-cli
sudo npm install grunt-cli -g

# Navigate to the project and install node dependencies
cd /vagrant
npm install

# Install Compass
sudo gem install compass

# Register grunt watch to run on startup
crontab -l | { cat; echo "@reboot grunt --base /vagrant watch"; } | crontab -

# Kick off an initial rebuild with grunt
grunt

# And then run the watch task
grunt watch &
