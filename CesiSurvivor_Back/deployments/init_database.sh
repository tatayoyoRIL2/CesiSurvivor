#!/bin/bash
set -e

# all constants
DB_USER='omega';
DB_PASSWD='Hb6w7';
DB_NAME='CesiSurvivor';
HOST='127.0.0.1';

# database connection and create database
mysql --user=${DB_USER} --host=${HOST} --password=${DB_PASSWD} <<EOF

DROP DATABASE IF EXISTS ${DB_NAME};

create database ${DB_NAME} default character set utf8 default collate utf8_bin;

use ${DB_NAME};

exit
EOF