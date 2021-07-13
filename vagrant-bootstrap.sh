#!/usr/bin/env bash

apt-get -y -q install nginx
echo 'Vagrant installed Nginx and PHP.'

add-apt-repository ppa:ondrej/php
apt-get -y -q install php7.2 php7.2-fpm php7.2-cli php7.2-mysql php7.2-curl php7.2-simplexml php7.2-dom php7.2-mbstring php7.2-zip php7.2-gd php7.2-intl php7.2-gmp php7.2-bcmath

# Set a temp password of 'root' for root mysql user
debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
echo 'Vagrant set root privileges for MySQL before the mysql-server install.'

# Install mysql-server
apt-get -y -q install mysql-server
echo 'Vagrant installed MySQL.'

# Install Composer and make available globally
apt-get -y -q install composer
echo 'Vagrant installed Composer.'

# Install npm
apt-get -y -q install npm

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

nvm install stable

nvm use stable

npm i -g npm
npm i -g postcss-cli
npm i -g purgecss
cd /var/www
npm install
echo 'Vagrant installed NPM.'

apt-get update -y -q
apt-get upgrade -y -q

echo 'Vagrant provisioning scripts are completed.'
