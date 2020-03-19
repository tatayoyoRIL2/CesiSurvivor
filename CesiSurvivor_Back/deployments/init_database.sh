#!/bin/bash
set -e

if [ "$(id -u)" = "0" ]; then
echo "Do not execute this script as root!"
exit 1
fi

# all constants
DB_USER='omega';
DB_PASSWD='0071';
DB_NAME='CesiSurvivor';
TABLE='test';

# database connection and commands
mysql --user=${DB_USER} --password=${DB_PASSWD} ${DB_NAME} <<EOF

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