#!/bin/bash
set -e

if [ "$(id -u)" = "0" ]; then
echo "Do not execute this script as root!"
exit 1
fi


go get github.com/gorilla/mux
go get github.com/jinzhu/gorm
go get github.com/go-sql-driver/mysql