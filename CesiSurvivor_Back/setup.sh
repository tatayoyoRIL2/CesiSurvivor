#!/bin/bash
set -e

# go setup
go get github.com/gorilla/mux
go get github.com/jinzhu/gorm
go get github.com/go-sql-driver/mysql

# bash setup
sudo apt-get update
sudo apt-get install mysql-client -y