#!/bin/bash
echo "###Jlog-Docker Packages###"

echo "=> Create Network & Volume"
docker network create jlog-network
docker volume create jlog-volume-db
docker volume create jlog-volume-resource

# mongodb
echo "=> DB(Mongo) Build & Run"
docker build -t gjdeveloper/jlog-db:1.0.0 .
docker run -d -p 27017:27017 -v jlog-volume-db:/data/db --network jlog-network --name jlog-db gjdeveloper/jlog-db:1.0.0

# backend
echo "=> Backend(Spring Boot, Tomcat) Build & Run"
docker build -t gjdeveloper/jlog-back:1.1.0 .
docker run -d -p 8080:8080 -e DB_HOST=jlog-db -e DB_ID=gjdeveloper -e DB_PW=1234qwer! -v jlog-volume-resource:/usr/local/jlog/files --network jlog-network --name jlog-back gjdeveloper/jlog-back:1.1.0

# frontend
echo "=> Frontend(React(ts), Nginx) Build & Run"
docker build -t gjdeveloper/jlog-front:1.1.0 .
docker run -d -p 3000:3000 -v jlog-volume-resource:/usr/local/jlog/files --network jlog-network --name jlog-front gjdeveloper/jlog-front:1.1.0