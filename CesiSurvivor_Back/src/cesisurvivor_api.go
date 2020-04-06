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

type User struct {
	IDUser   uint    `gorm:"primary_key"; json:"idUser""` // table: id_user
	Username  string `json:"username"` // table: username
}

type Score struct {
	IDScore   uint    `gorm:"primary_key"; json:"idScore""` // table: id_score
	Score  uint `json:"score"` // table: score
	IDUser   uint    `json:"idUser""` // table: id_user
}

func homePage(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Welcome to HomePage!")
	fmt.Println("Endpoint Hit: HomePage")
}

func returnAllUsers(w http.ResponseWriter, r *http.Request) {
	// define header
	w.Header().Set("Content-Type", "application/json")
	w.Header().Set("Content-Access-Control-Allow-Origin", "*")

	// get all users
	fmt.Println("Endpoint Hit: returnAllUsers")
	user := []User{}
	db.Find(&user)
	fmt.Println(user)
	fmt.Println(&user)
	json.NewEncoder(w).Encode(user)
}

func returnUsersById(w http.ResponseWriter, r *http.Request) {
	// define header
	w.Header().Set("Content-Type", "application/json")
	w.Header().Set("Content-Access-Control-Allow-Origin", "*")

	// get id
	fmt.Println("Endpoint Hit: returnUsersById")
	id := mux.Vars(r)["id"]
	fmt.Println(id)

	// get user by id
	user := []User{}
	db.Find(&user, id)
	fmt.Println(user)
	fmt.Println(&user)
	json.NewEncoder(w).Encode(user)
}

func postUser(w http.ResponseWriter, r *http.Request) {
	// define header
	w.Header().Set("Content-Type", "application/json")
	w.Header().Set("Content-Access-Control-Allow-Origin", "*")

	// get body
	fmt.Println("Endpoint Hit: postUser")
	var user User
	err = json.NewDecoder(r.Body).Decode(&user)
	fmt.Println(err)
	fmt.Println(user)
	if err != nil {
		http.Error(w, "Error marshaling JSON", http.StatusInternalServerError)
		return
	}

	// insert into db
	db.Create(&user)
	fmt.Println(user)
	fmt.Println(&user)
	json.NewEncoder(w).Encode(user)
}

func returnAllScores(w http.ResponseWriter, r *http.Request) {
	// define header
	w.Header().Set("Content-Type", "application/json")
	w.Header().Set("Content-Access-Control-Allow-Origin", "*")

	// get all score
	fmt.Println("Endpoint Hit: returnAllScores")
	score := []Score{}
	db.Find(&score)
	fmt.Println(score)
	fmt.Println(&score)
	json.NewEncoder(w).Encode(score)
}

func returnScoreById(w http.ResponseWriter, r *http.Request) {
	// define header
	w.Header().Set("Content-Type", "application/json")
	w.Header().Set("Content-Access-Control-Allow-Origin", "*")

	// get id
	fmt.Println("Endpoint Hit: returnScoreById")
	id := mux.Vars(r)["id"]
	fmt.Println(id)

	// get score by id
	score := []Score{}
	db.Find(&score, id)
	fmt.Println(score)
	fmt.Println(&score)
	json.NewEncoder(w).Encode(score)
}

func postScore(w http.ResponseWriter, r *http.Request) {
	// define header
	w.Header().Set("Content-Type", "application/json")
	w.Header().Set("Content-Access-Control-Allow-Origin", "*")

	// get body
	fmt.Println("Endpoint Hit: postScore")
	var score Score
	err = json.NewDecoder(r.Body).Decode(&score)
	fmt.Println(err)
	fmt.Println(score)
	if err != nil {
		http.Error(w, "Error marshaling JSON", http.StatusInternalServerError)
		return
	}

	// insert into db
	db.Create(&score)
	fmt.Println(score)
	fmt.Println(&score)
	json.NewEncoder(w).Encode(score)
}

func handleRequests() {
	log.Println("Starting development server at http://127.0.0.1:10000/")
	log.Println("Quit the server with CONTROL-C.")
	// creates a new instance of a mux router
	myRouter := mux.NewRouter().StrictSlash(true)
	myRouter.HandleFunc("/", homePage)

	myRouter.HandleFunc("/user", returnAllUsers).Methods("GET")
	myRouter.HandleFunc("/user/{id}", returnUsersById).Methods("GET")
	myRouter.HandleFunc("/user", postUser).Methods("POST")

	myRouter.HandleFunc("/score", returnAllScores).Methods("GET")
	myRouter.HandleFunc("/score/{id}", returnScoreById).Methods("GET")
	myRouter.HandleFunc("/score", postScore).Methods("POST")

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
	db.AutoMigrate(&User{}, &Score{})
	handleRequests()
}
