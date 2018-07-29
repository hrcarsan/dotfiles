#!/bin/sh

if [ "$(id -u)" != "0" ]; then
   echo "Run as root"
   exit 1
fi

######################## INSTALL MYSQL #################################

# dependencies
apt-get -y install cmake bison flex git build-essential libncurses5-dev

# install openssl old (for work too with php5.3)
cd /usr/local/src/
wget https://www.openssl.org/source/old/0.9.x/openssl-0.9.8zh.tar.gz
tar -zxvf openssl-0.9.8zh.tar.gz
cd openssl-0.9.8zh
./config --prefix=/usr/local --openssldir=/usr/local/openssl-0.9.8
make
make install

useradd -r -U mysql -M -d /usr/local/mysql/data

#  install mysql server
cd /usr/local/src/
wget https://downloads.mysql.com/archives/get/file/mysql-5.6.23.tar.gz
tar xzvf mysql-5.6.23.tar.gz
cd mysql-5.6.23
cmake . -DWITH_SSL=yes
make
make install

echo "export PATH=\"\$PATH:/usr/local/mysql/bin\"" >> /etc/bash.bashrc
source /etc/bash.bashrc

cd /usr/local/mysql
chown -R mysql:mysql .
scripts/mysql_install_db --user=mysql
chown -R root:root .
chown -R mysql:mysql data
chmod -R go-rwx data
mv my.cnf my.cnf.def
mkdir /etc/mysql/
cp support-files/my-default.cnf /etc/mysql/my.cnf
mysqld_safe --user=mysql > /dev/null 2>&1 &
mysql_secure_installation
cp support-files/mysql.server /etc/init.d/mysql
update-rc.d mysql defaults
service mysql start


#################### INSTALL PHP #########################################

# dependecies
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
source /etc/bash.bashrc

mkdir /etc/php
mkdir /etc/php/conf.d
cp php.ini-development /etc/php/php.ini
cp /usr/local/php/etc/php-fpm.conf.default /etc/php/php-fpm.conf

cp sapi/fpm/php-fpm.service  /etc/systemd/system/
sed 's:${prefix}\|${exec_prefix}:/usr/local/php:g' /etc/systemd/system/php-fpm.service
systemctl enable php-fpm
systemctl start php-fpm

# timezonedb
pecl install timezonedb
echo "extension=timezonedb.so"  >> /etc/php/php.ini

# ioncube installation
cd /tmp
wget http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz
tar xvfz ioncube_loaders_lin_x86-64.tar.gz
cd ioncube
mkdir -p /usr/local/php/lib/php/extensions/no-debug-non-zts-20090626
cp ioncube_loader_lin_5.3.so /usr/local/php/lib/php/extensions/no-debug-non-zts-20090626
echo "zend_extension = /usr/local/php/lib/php/extensions/no-debug-non-zts-20090626/ioncube_loader_lin_5.3.so" >> /etc/php/php.ini

