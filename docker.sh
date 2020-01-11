#!/bin/bash
if [ $(command -v docker) ]; then
	if [ $(docker run -d -p 8080:8080 -p 9090:9090 -e TZ=Europe/Amsterdam webgoat/goatandwolf) ]; then
		echo "Webgoat and webwolf started."
		echo "WebGoat running on http://localhost:8080/WebGoat"
		echo "WebWolf running on http://localhost:9090/WebWolf"
	else
		echo "WebGoat and WebWolf already running."
		echo "WebGoat running on http://localhost:8080/WebGoat"
		echo "WebWolf running on http://localhost:9090/WebWolf"
	fi
else
	# check dist
	if [ $(uname -a | grep -i ubuntu) ]; then
		sudo apt update && sudo apt install software-properties-common gnupg2 curl ca-certificates apt-transport-https
		sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
	else
		sudo apt update && sudo apt install software-properties-common apt-transport-https ca-certificates curl gnupg2
		sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
	fi
	sudo apt update && sudo apt install docker-ce
	sudo apt install docker-compose
	sudo adduser $USER docker
fi
