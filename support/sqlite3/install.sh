#!/bin/bash

# I use this script to help me enhance the ability of 
# heroku-buildpack

echo Starting SQLite3 Installation

rails_root=`pwd`

echo Location is
echo $rails_root

# I should install sqlite3 software locally under Rails.root

mkdir -p ${rails_root}/vendor/sqlite3
mkdir -p ${rails_root}/vendor/gems/sqlite3

cd ${rails_root}/vendor/

echo Startind download...
wget https://www.sqlite.org/2018/sqlite-autoconf-3230100.tar.gz -C ${rails_root}/
echo Download finished.

tar zxf ${rails_root}/sqlite-autoconf-3230100.tar.gz

cd ${rails_root}/sqlite-autoconf-3230100/
./configure --prefix=${rails_root}/vendor/sqlite3
make
make install

cd ${rails_root}/vendor/

# I should be able to gem install sqlite3 now
gem install -v 1.3.13 -- --with-sqlite3-dir=${rails_root}/vendor/sqlite3

exit