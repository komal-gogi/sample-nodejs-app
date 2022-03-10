#!/bin/bash
  
#Cloning the repository 
git clone https\://github.com/komal-gogi/sample-nodejs-app
cd sample-nodejs-app

#Initializing Docker swarm
docker swarm init
echo -e '\n \n'

#we can join manager node to worker using "docker swarm join --token ip"

#Deploying docker swarm for single node
docker stack deploy -c docker-compose.yml swarmnodeapp
echo -e "\nservices created .........\n\n"

#List the docker services
docker service ls