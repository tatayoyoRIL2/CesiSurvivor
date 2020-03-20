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
TABLE='test';

# database connection and commands
mysql --user=${DB_USER} --password=${DB_PASSWD} <<EOF

DROP DATABASE IF EXISTS ${DB_NAME};

create database ${DB_NAME} default character set utf8 default collate utf8_bin;

use ${DB_NAME};

DROP TABLE IF EXISTS ${TABLE};

CREATE TABLE IF NOT EXISTS ${TABLE} (
    id INT AUTO_INCREMENT primary key NOT NULL,
    day VARCHAR(255) NOT NULL,
    time VARCHAR(255) NOT NULL,
    msg VARCHAR(255) NOT NULL
);

INSERT INTO ${TABLE} (\`id\`, \`day\`, \`time\`, \`msg\`) VALUES (NULL, "monday", "16:47", "Hey bro!");

exit
EOF