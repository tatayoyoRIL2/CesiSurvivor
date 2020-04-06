#!/bin/bash
set -e

# all constants
DB_USER='omega'
DB_PASSWD='Hb6w7'
DB_NAME='CesiSurvivor'
TABLE_USERS='users'
TABLE_SCORES='scores'
TABLE_QUESTIONS='questions'
TABLE_ANSWERS='answers'

# database connection and commands
mysql --user=${DB_USER} --host=127.0.0.1 --password=${DB_PASSWD} <<EOF

DROP DATABASE IF EXISTS ${DB_NAME};
create database ${DB_NAME} default character set utf8 default collate utf8_bin;
use ${DB_NAME};

DROP TABLE IF EXISTS ${TABLE_USERS};
CREATE TABLE IF NOT EXISTS ${TABLE_USERS} (
    id_user INT AUTO_INCREMENT primary key NOT NULL,
    username VARCHAR(255) NOT NULL
);
INSERT INTO ${TABLE_USERS} (\`id_user\`, \`username\`) VALUES (NULL, "omega");
INSERT INTO ${TABLE_USERS} (\`id_user\`, \`username\`) VALUES (NULL, "yoyotata");

DROP TABLE IF EXISTS ${TABLE_SCORES};
CREATE TABLE IF NOT EXISTS ${TABLE_SCORES} (
    id_score INT AUTO_INCREMENT primary key NOT NULL,
    score INT NOT NULL,
    id_user VARCHAR(255) NOT NULL
);
INSERT INTO ${TABLE_SCORES} (\`id_score\`, \`score\`, \`id_user\`) VALUES (NULL, 7, 1);
INSERT INTO ${TABLE_SCORES} (\`id_score\`, \`score\`, \`id_user\`) VALUES (NULL, 9, 2);

DROP TABLE IF EXISTS ${TABLE_QUESTIONS};
CREATE TABLE IF NOT EXISTS ${TABLE_QUESTIONS} (
    id_question INT AUTO_INCREMENT primary key NOT NULL,
    label VARCHAR(255) NOT NULL,
    answer_list VARCHAR(255) NOT NULL
);
INSERT INTO ${TABLE_QUESTIONS} (\`id_question\`, \`label\`, \`answer_list\`) VALUES (NULL, "A", "[1, 2, 3, 4]");
INSERT INTO ${TABLE_QUESTIONS} (\`id_question\`, \`label\`, \`answer_list\`) VALUES (NULL, "B", "[5, 6, 7, 8]");
INSERT INTO ${TABLE_QUESTIONS} (\`id_question\`, \`label\`, \`answer_list\`) VALUES (NULL, "C", "[9, 10, 11, 12]");
INSERT INTO ${TABLE_QUESTIONS} (\`id_question\`, \`label\`, \`answer_list\`) VALUES (NULL, "B", "[13, 14, 15, 16]");

DROP TABLE IF EXISTS ${TABLE_ANSWERS};
CREATE TABLE IF NOT EXISTS ${TABLE_ANSWERS} (
    idAnswer INT AUTO_INCREMENT primary key NOT NULL,
    label VARCHAR(255) NOT NULL,
    picture VARCHAR(255) NOT NULL,
    idQuestion INT NOT NULL
);
INSERT INTO ${TABLE_ANSWERS} (\`idAnswer\`, \`label\`, \`picture\`, \`idQuestion\`) VALUES (NULL, "A", "MY_PICTURE", "1");
INSERT INTO ${TABLE_ANSWERS} (\`idAnswer\`, \`label\`, \`picture\`, \`idQuestion\`) VALUES (NULL, "B", "MY_PICTURE", "1");
INSERT INTO ${TABLE_ANSWERS} (\`idAnswer\`, \`label\`, \`picture\`, \`idQuestion\`) VALUES (NULL, "C", "MY_PICTURE", "1");
INSERT INTO ${TABLE_ANSWERS} (\`idAnswer\`, \`label\`, \`picture\`, \`idQuestion\`) VALUES (NULL, "D", "MY_PICTURE", "1");
INSERT INTO ${TABLE_ANSWERS} (\`idAnswer\`, \`label\`, \`picture\`, \`idQuestion\`) VALUES (NULL, "E", "MY_PICTURE", "2");
INSERT INTO ${TABLE_ANSWERS} (\`idAnswer\`, \`label\`, \`picture\`, \`idQuestion\`) VALUES (NULL, "F", "MY_PICTURE", "1");
INSERT INTO ${TABLE_ANSWERS} (\`idAnswer\`, \`label\`, \`picture\`, \`idQuestion\`) VALUES (NULL, "G", "MY_PICTURE", "1");
INSERT INTO ${TABLE_ANSWERS} (\`idAnswer\`, \`label\`, \`picture\`, \`idQuestion\`) VALUES (NULL, "H", "MY_PICTURE", "1");
INSERT INTO ${TABLE_ANSWERS} (\`idAnswer\`, \`label\`, \`picture\`, \`idQuestion\`) VALUES (NULL, "I", "MY_PICTURE", "3");
INSERT INTO ${TABLE_ANSWERS} (\`idAnswer\`, \`label\`, \`picture\`, \`idQuestion\`) VALUES (NULL, "J", "MY_PICTURE", "1");
INSERT INTO ${TABLE_ANSWERS} (\`idAnswer\`, \`label\`, \`picture\`, \`idQuestion\`) VALUES (NULL, "K", "MY_PICTURE", "1");
INSERT INTO ${TABLE_ANSWERS} (\`idAnswer\`, \`label\`, \`picture\`, \`idQuestion\`) VALUES (NULL, "L", "MY_PICTURE", "1");
INSERT INTO ${TABLE_ANSWERS} (\`idAnswer\`, \`label\`, \`picture\`, \`idQuestion\`) VALUES (NULL, "M", "MY_PICTURE", "4");
INSERT INTO ${TABLE_ANSWERS} (\`idAnswer\`, \`label\`, \`picture\`, \`idQuestion\`) VALUES (NULL, "N", "MY_PICTURE", "1");
INSERT INTO ${TABLE_ANSWERS} (\`idAnswer\`, \`label\`, \`picture\`, \`idQuestion\`) VALUES (NULL, "O", "MY_PICTURE", "1");
INSERT INTO ${TABLE_ANSWERS} (\`idAnswer\`, \`label\`, \`picture\`, \`idQuestion\`) VALUES (NULL, "P", "MY_PICTURE", "1");

exit
EOF
