# The CesiSurvivor Back

This is the back !
<p align="center">
	<img src="https://flat.badgen.net/github/branches/tatayoyoRIL2/CesiSurvivor" alt="branches">
	<img src="https://flat.badgen.net/github/releases/tatayoyoRIL2/CesiSurvivor" alt="releases">
	<img src="https://flat.badgen.net/github/open-issues/tatayoyoRIL2/CesiSurvivor" alt="openIssues">
	<img src="https://flat.badgen.net/github/last-commit/tatayoyoRIL2/CesiSurvivor" alt="lastCommit">
	<img src="https://flat.badgen.net/github/license/tatayoyoRIL2/CesiSurvivor" alt="license">
</p>

![Go logo](docs/pictures/go-logo.png)

## ⚙️ Init database
```sh
$ /bin/bash deployments/init_database.sh
```

## 📄 Binary Distributions
```sh
$ ./*.go
```

## 🚀 Usage
### get datas:
```sh
url: "http://omegabionic.ddns.net:10183/user"
url: "http://omegabionic.ddns.net:10183/score"
url: "http://omegabionic.ddns.net:10183/question"
url: "http://omegabionic.ddns.net:10183/answer"
```

### get by id:
```sh
url: "http://omegabionic.ddns.net:10183/user/1"
url: "http://omegabionic.ddns.net:10183/score/1"
url: "http://omegabionic.ddns.net:10183/question/2"
url: "http://omegabionic.ddns.net:10183/answer/2"
```

### post data:
```sh
url: "http://omegabionic.ddns.net:10183/user"
body: {"username":"omega"}

url: "http://omegabionic.ddns.net:10183/score"
body: {"score":7,"idUser":1}

url: "http://omegabionic.ddns.net:10183/question"
body: {"label":"A","answerList":"[1, 2, 3, 4]"}

url: "http://omegabionic.ddns.net:10183/answer"
body: "{"label":"A","picture":"MY_PICTURE","idQuestion":1}"
```

### 👏 Contributing
* omegaBionic
* tatayoyoRIL2
