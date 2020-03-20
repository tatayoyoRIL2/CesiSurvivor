package main

import (
	"log"

	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
)

var db *gorm.DB
var err error

func main() {
	// open database
	db, err = gorm.Open("mysql", "root:0071@tcp(127.0.0.1:3306)/CesiSurvivor?charset=utf8&parseTime=True")
	if err != nil {
		log.Println("Connection Failed to Open")
	} else {
		log.Println("Connection Established")
	}

	// struct in object the database
	db.AutoMigrate(&Test{})
	log.Println(db)
}

type Test struct {
	Id   int    `json:”id”`
	day  string `json:”user”`
	time string `json:”user”`
	msg  string `json:”user”`
}
