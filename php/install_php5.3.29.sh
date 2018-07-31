#!/bin/bash

if [ "$(id -u)" != "0" ]; then
   echo "Run with sudo"
   exit 1
fi

# dependecies
source ../mysql/install_mysql5.6.23.sh

apt-get install -y build-essential libxml2-dev libssl-dev libbz2-dev libpng-dev libc-client-dev libkrb5-dev libmcrypt-dev \
                   pkg-config libmysqlclient-dev libreadline-dev libtool autoconf nginx

# libcurl
cd /usr/local/include
sudo ln -s /usr/include/x86_64-linux-gnu/curl curl
sudo apt-get install libcurl4-gnutls-dev

# install php
cd /usr/local/src/
export PHP_VERSION=5.3.29
curl -SL "http://php.net/get/php-$PHP_VERSION.tar.gz/from/this/mirror" -o php-$PHP_VERSION.tar.gz
tar -xzvf php-$PHP_VERSION.tar.gz
cd php-$PHP_VERSION
./configure \
  --prefix=/usr/local/php \
  --with-config-file-path=/etc/php \
  --with-config-file-scan-dir=/etc/php/conf.d \
  --enable-mbstring \
  --with-curl \
  --with-openssl \
  --with-xmlrpc \
  --enable-soap \
  --enable-zip \
  --with-gd \
  --enable-mysqlnd \
  --with-mysql=mysqlnd \
  --with-mysqli=mysqlnd \
  --enable-bcmath \
  --with-bz2 \
  --enable-calendar \
  --enable-exif \
  --enable-ftp \
  --with-gettext \
  --with-imap \
  --with-imap-ssl \
  --with-kerberos \
  --with-mcrypt \
  --enable-pcntl \
  --with-pdo-mysql \
  --with-mhash \
  --with-readline \
  --enable-sockets \
  --enable-sysvmsg \
  --enable-sysvsem \
  --enable-sysvshm \
  --enable-shmop \
  --enable-wddx \
  --with-zlib \
  --enable-fpm \
  --with-fpm-user=www-data \
  --with-fpm-group=www-data
make
make install

echo "export PATH=\"\$PATH:/usr/local/php/bin\"" >> /etc/bash.bashrc

mkdir /etc/php
mkdir /etc/php/conf.d
cp php.ini-development /etc/php/php.ini
cp /usr/local/php/etc/php-fpm.conf.default /etc/php/php-fpm.conf

cp sapi/fpm/php-fpm.service  /etc/systemd/system/
sed -i 's:${prefix}/var:/usr/local/php/var:;s:${exec_prefix}:/usr/local/php:;s:${prefix}/etc:/etc/php:' /etc/systemd/system/php-fpm.service
systemctl enable php-fpm
systemctl start php-fpm

# timezonedb
/usr/local/php/bin/pecl install timezonedb
echo "extension=timezonedb.so"  >> /etc/php/php.ini

# ioncube installation
cd /tmp
wget http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz
tar xvfz ioncube_loaders_lin_x86-64.tar.gz
cd ioncube
cp ioncube_loader_lin_5.3.so /usr/local/php/lib/php/extensions/no-debug-non-zts-20090626
echo "zend_extension = /usr/local/php/lib/php/extensions/no-debug-non-zts-20090626/ioncube_loader_lin_5.3.so" >> /etc/php/php.ini

# xcache
cd /tmp
apt-get install autoconf

export XCACHE_VER=3.1.0
wget http://xcache.lighttpd.net/pub/Releases/$XCACHE_VER/xcache-$XCACHE_VER.tar.gz
tar xzvf xcache-$XCACHE_VER.tar.gz
cd xcache-$XCACHE_VER
/usr/local/php/bin/phpize
./configure --enable-xcache --with-php-config=/usr/local/php/bin/php-config
make
make install

echo "extension=xcache.so"  >> /etc/php/php.ini
