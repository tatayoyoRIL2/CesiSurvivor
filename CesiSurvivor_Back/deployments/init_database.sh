#!/bin/bash
set -e

# all constants
DB_USER='omega'
DB_PASSWD='Hb6w7'
DB_NAME='CesiSurvivor'
TABLE_USERS='users'
TABLE_SCORES='scores'
TABLE_QUESTIONS='questions'

# database connection and commands
mysql --user=${DB_USER} --host=127.0.0.1 --password=${DB_PASSWD} <<EOF

DROP DATABASE IF EXISTS ${DB_NAME};
create database ${DB_NAME} default character set utf8 default collate utf8_bin;
use ${DB_NAME};

DROP TABLE IF EXISTS ${TABLE_USERS};
CREATE TABLE IF NOT EXISTS ${TABLE_USERS} (
    idUser INT AUTO_INCREMENT primary key NOT NULL,
    username VARCHAR(255) NOT NULL
);
INSERT INTO ${TABLE_USERS} (\`idUser\`, \`username\`) VALUES (NULL, "omega");
INSERT INTO ${TABLE_USERS} (\`idUser\`, \`username\`) VALUES (NULL, "yoyotata");

DROP TABLE IF EXISTS ${TABLE_SCORES};
CREATE TABLE IF NOT EXISTS ${TABLE_SCORES} (
    idScore INT AUTO_INCREMENT primary key NOT NULL,
    score INT NOT NULL,
    idUser VARCHAR(255) NOT NULL
);
INSERT INTO ${TABLE_SCORES} (\`idScore\`, \`score\`, \`idUser\`) VALUES (NULL, 7, 1);
INSERT INTO ${TABLE_SCORES} (\`idScore\`, \`score\`, \`idUser\`) VALUES (NULL, 9, 2);

DROP TABLE IF EXISTS ${TABLE_QUESTIONS};
CREATE TABLE IF NOT EXISTS ${TABLE_QUESTIONS} (
    idQuestion INT AUTO_INCREMENT primary key NOT NULL,
    label VARCHAR(255) NOT NULL,
    answerList VARCHAR(255) NOT NULL
);
INSERT INTO ${TABLE_QUESTIONS} (\`idQuestion\`, \`label\`, \`answerList\`) VALUES (NULL, "A", "[1, 2, 3, 4]");
INSERT INTO ${TABLE_QUESTIONS} (\`idQuestion\`, \`label\`, \`answerList\`) VALUES (NULL, "B", "[5, 6, 7, 8]");
INSERT INTO ${TABLE_QUESTIONS} (\`idQuestion\`, \`label\`, \`answerList\`) VALUES (NULL, "C", "[9, 10, 11, 12]");
INSERT INTO ${TABLE_QUESTIONS} (\`idQuestion\`, \`label\`, \`answerList\`) VALUES (NULL, "B", "[13, 14, 15, 16]");

exit
EOF
