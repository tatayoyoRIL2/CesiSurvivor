#!/bin/bash
set -e

if [ "$(id -u)" = "0" ]; then
echo "Do not execute this script as root!"
exit 1
fi

# all constants
DB_USER='admin';
DB_PASSWD='0071';
DB_NAME='CesiSurvivor';

# database connection and create database
mysql --user=${DB_USER} --password=${DB_PASSWD} <<EOF

DROP DATABASE IF EXISTS ${DB_NAME};

create database ${DB_NAME} default character set utf8 default collate utf8_bin;

use ${DB_NAME};

exit
EOF