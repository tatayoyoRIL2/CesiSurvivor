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
INSERT INTO ${TABLE_QUESTIONS} (\`id_question\`, \`label\`, \`answer_list\`) VALUES (NULL, "Vous vous appelez Éric, vous entrez au CESI... Où allez-vous ? :)", "[1, 2, 3, 4]");
INSERT INTO ${TABLE_QUESTIONS} (\`id_question\`, \`label\`, \`answer_list\`) VALUES (NULL, "Vous coûtez trop chère, on paye déjà trop de place des parking !", "[5]");
INSERT INTO ${TABLE_QUESTIONS} (\`id_question\`, \`label\`, \`answer_list\`) VALUES (NULL, "Vous entrez dans la salle des RILB2...", "[6, 7, 8, 9]");
INSERT INTO ${TABLE_QUESTIONS} (\`id_question\`, \`label\`, \`answer_list\`) VALUES (NULL, "Vous êtes embauché ! Faites ce qu'il vous plaît !!!", "[10, 11, 12, 13]");
INSERT INTO ${TABLE_QUESTIONS} (\`id_question\`, \`label\`, \`answer_list\`) VALUES (NULL, "Vous avez abusé...", "[5]");
INSERT INTO ${TABLE_QUESTIONS} (\`id_question\`, \`label\`, \`answer_list\`) VALUES (NULL, "Vous avez fait un super discours, entrez dans un bureau maintenant !", "[1, 2, 3]");
INSERT INTO ${TABLE_QUESTIONS} (\`id_question\`, \`label\`, \`answer_list\`) VALUES (NULL, "Vous vous êtes pris un vent !", "[5]");
INSERT INTO ${TABLE_QUESTIONS} (\`id_question\`, \`label\`, \`answer_list\`) VALUES (NULL, "Gniii", "[10, 12]");
INSERT INTO ${TABLE_QUESTIONS} (\`id_question\`, \`label\`, \`answer_list\`) VALUES (NULL, "Vous êtes pendant l'oral d'un groupe de RILB2", "[14, 15, 16, 17]");
INSERT INTO ${TABLE_QUESTIONS} (\`id_question\`, \`label\`, \`answer_list\`) VALUES (NULL, "Vous êtes viré !!!!!!!!", "[5]");
INSERT INTO ${TABLE_QUESTIONS} (\`id_question\`, \`label\`, \`answer_list\`) VALUES (NULL, "YOU WIIIIIIINNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN <3", "[5]");

DROP TABLE IF EXISTS ${TABLE_ANSWERS};
CREATE TABLE IF NOT EXISTS ${TABLE_ANSWERS} (
    id_answer INT AUTO_INCREMENT primary key NOT NULL,
    label VARCHAR(255) NOT NULL,
    picture VARCHAR(255) NOT NULL,
    id_question INT NOT NULL
);
INSERT INTO ${TABLE_ANSWERS} (\`id_answer\`, \`label\`, \`picture\`, \`id_question\`) VALUES (NULL, "Dans le bureau de Maude", "MY_PICTURE", "2");
INSERT INTO ${TABLE_ANSWERS} (\`id_answer\`, \`label\`, \`picture\`, \`id_question\`) VALUES (NULL, "Dans le bureau du directeur au chapeau noir", "MY_PICTURE", "2");
INSERT INTO ${TABLE_ANSWERS} (\`id_answer\`, \`label\`, \`picture\`, \`id_question\`) VALUES (NULL, "Dans le bureau de Thibaut", "MY_PICTURE", "4");
INSERT INTO ${TABLE_ANSWERS} (\`id_answer\`, \`label\`, \`picture\`, \`id_question\`) VALUES (NULL, "Dans la salle des RILB2...", "MY_PICTURE", "3");

INSERT INTO ${TABLE_ANSWERS} (\`id_answer\`, \`label\`, \`picture\`, \`id_question\`) VALUES (NULL, "Perdu !", "MY_PICTURE", "1");

INSERT INTO ${TABLE_ANSWERS} (\`id_answer\`, \`label\`, \`picture\`, \`id_question\`) VALUES (NULL, "Bonjour Bonjour, je suis le pape François", "MY_PICTURE", "4");
INSERT INTO ${TABLE_ANSWERS} (\`id_answer\`, \`label\`, \`picture\`, \`id_question\`) VALUES (NULL, "Gniiiiiiiii", "MY_PICTURE", "6");
INSERT INTO ${TABLE_ANSWERS} (\`id_answer\`, \`label\`, \`picture\`, \`id_question\`) VALUES (NULL, "Wallah je vous jure que je vais tous vous niquer", "MY_PICTURE", "6");
INSERT INTO ${TABLE_ANSWERS} (\`id_answer\`, \`label\`, \`picture\`, \`id_question\`) VALUES (NULL, "Ta grand mère suce des ours en Thailande !", "MY_PICTURE", "5");

INSERT INTO ${TABLE_ANSWERS} (\`id_answer\`, \`label\`, \`picture\`, \`id_question\`) VALUES (NULL, "Aller draguer les secrétaires !", "MY_PICTURE", "7");
INSERT INTO ${TABLE_ANSWERS} (\`id_answer\`, \`label\`, \`picture\`, \`id_question\`) VALUES (NULL, "Se prendre un café bien serrer", "MY_PICTURE", "8");
INSERT INTO ${TABLE_ANSWERS} (\`id_answer\`, \`label\`, \`picture\`, \`id_question\`) VALUES (NULL, "Faire passer un oral aux RILB2", "MY_PICTURE", "9");
INSERT INTO ${TABLE_ANSWERS} (\`id_answer\`, \`label\`, \`picture\`, \`id_question\`) VALUES (NULL, "Me prendre une bière", "MY_PICTURE", "8");

INSERT INTO ${TABLE_ANSWERS} (\`id_answer\`, \`label\`, \`picture\`, \`id_question\`) VALUES (NULL, "Gni, mais quel est le rapport avec les plugins ?!", "MY_PICTURE", "10");
INSERT INTO ${TABLE_ANSWERS} (\`id_answer\`, \`label\`, \`picture\`, \`id_question\`) VALUES (NULL, "Gniiiiiiiii power", "MY_PICTURE", "10");
INSERT INTO ${TABLE_ANSWERS} (\`id_answer\`, \`label\`, \`picture\`, \`id_question\`) VALUES (NULL, "Gni, puis poser une question constructive", "MY_PICTURE", "11");
INSERT INTO ${TABLE_ANSWERS} (\`id_answer\`, \`label\`, \`picture\`, \`id_question\`) VALUES (NULL, "Rigoler comme Hollande, êtes-vous sûrs qu'il n'y a pas de plugins ???!", "MY_PICTURE", "10");

exit
EOF
