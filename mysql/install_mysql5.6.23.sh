#!/bin/bash

if [ "$(id -u)" != "0" ]; then
   echo "Run as root"
   exit 1
fi

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

cd /usr/local/mysql
chown -R mysql:mysql .
scripts/mysql_install_db --user=mysql
chown -R root:root .
chown -R mysql:mysql data
chmod -R go-rwx data
mv my.cnf my.cnf.def
mkdir /etc/mysql/
cp support-files/my-default.cnf /etc/mysql/my.cnf
./bin/mysqld_safe --user=mysql > /dev/null 2>&1 &
./bin/mysql_secure_installation
cp support-files/mysql.server /etc/init.d/mysql
update-rc.d mysql defaults
service mysql start
