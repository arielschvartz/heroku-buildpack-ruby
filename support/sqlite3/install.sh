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
wget https://www.sqlite.org/2018/sqlite-autoconf-3230100.tar.gz
echo Download finished.

tar zxf sqlite-autoconf-3230100.tar.gz

cd sqlite-autoconf-3230100/
./configure --prefix=${rails_root}/vendor/sqlite3
make
make install

cd ${rails_root}/vendor/

# I should be able to gem install sqlite3 now
gem install -v 1.3.13 --install-dir gems/sqlite3/ sqlite3 -- --with-sqlite3-dir=${rails_root}/vendor/sqlite3
cp gems/sqlite3/specifications/sqlite3-1.3.13.gemspec gems/sqlite3/gems/sqlite3-1.3.13/

exit