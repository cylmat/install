#!/bin/bash

# build-prerequisites
sudo apt-get install ninja-build gettext cmake unzip curl
sudo apt install -y build-essential pkg-config

#############
# Languages #
#############

### Php-env : @https://github.com/phpenv/phpenv
# @https://github.com/phpenv/phpenv-installer
# or sudo update-alternatives --config php
curl -L https://raw.githubusercontent.com/phpenv/phpenv-installer/master/bin/phpenv-installer | PHPENV_ROOT=$HOME/.phpenv bash

apt install -y libreadline-dev libbz2-dev libpng-dev libsqlite3-dev libssl-dev libxml2-dev zlib1g-dev libzip-dev
cp ~/.phpenv/plugins/php-build/share/php-build/default_configure_options ~/.phpenv/plugins/php-build/share/php-build/default_configure_options.bak

vim ~/.phpenv/plugins/php-build/share/php-build/default_configure_options
vim ~/.phpenv/plugins/php-build/share/php-build/definitions/8.3.0    # keep install_package "https://www.php.net/distributions/php-8.3.0.tar.bz2"
PHP_BUILD_DEBUG=yes phpenv install 8.3.0 # Download from https://www.php.net/distributions/php-8.3.0.tar.bz2

sudo update-alternatives --install /usr/local/bin/php php ~/.phpenv/versions/8.3.0/bin/php 1

### Node
Node : https://docs.volta.sh

### Ruby version manager : @https://rvm.io
gpg2 --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable --rails

### Python : @https://github.com/pyenv/pyenv
curl https://pyenv.run | bash


#############
# Databases #
#############

# MongoDb
curl -fsSL https://pgp.mongodb.com/server-4.4.asc | gpg -o /usr/share/keyrings/mongodb-server-4.4.gpg --dearmor
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-4.4.gpg ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.4.list
# -> select the Geographic area 8 "Europe", 37 "Paris"
apt update && apt install -y mongodb-org
#export MONGO_URI=mongodb://root:root@localhost:27017
mongod --dbpath /data/db --port 27017 --fork --logpath /var/log/mongodb/mongod.log
mongo admin --eval 'db.createUser({user:"root",pwd:"root",roles:[{role:"userAdminAnyDatabase",db:"admin"}]})'

# Redis
curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list
apt-get update && apt-get install redis
redis-server &

# Sqlite
apt install -y sqlite3
sqlite3 test.db

# Memcached
# @use : sudo systemctl start memcached
apt install -y memcached libmemcached-tools
