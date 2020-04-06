package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"

	"github.com/gorilla/mux"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
)

var db *gorm.DB
var err error

type Test struct {
	Id   int    `json:”id”`
	Day  string `json:”day”`
	Time string `json:”time”`
	Msg  string `json:”msg”`
}

func homePage(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Welcome to HomePage!")
	fmt.Println("Endpoint Hit: HomePage")
}

func returnAllTests(w http.ResponseWriter, r *http.Request) {
	fmt.Println("Endpoint Hit: returnAllTest")
	test := []Test{}
	db.Find(&test)
	fmt.Println(test)
	fmt.Println(&test)
	json.NewEncoder(w).Encode(test)
}

func handleRequests() {
	log.Println("Starting development server at http://127.0.0.1:10000/")
	log.Println("Quit the server with CONTROL-C.")
	// creates a new instance of a mux router
	myRouter := mux.NewRouter().StrictSlash(true)
	myRouter.HandleFunc("/", homePage)
	myRouter.HandleFunc("/all-tests", returnAllTests)
	log.Fatal(http.ListenAndServe(":10000", myRouter))
}

func main() {
	// open database
	db, err = gorm.Open("mysql", "omega:Hb6w7@tcp(127.0.0.1:3306)/CesiSurvivor?charset=utf8&parseTime=True")
	if err != nil {
		log.Println("Connection Failed to Open")
	} else {
		log.Println("Connection Established")
	}

	// struct in object the database
	db.AutoMigrate(&Test{})
	handleRequests()
}
