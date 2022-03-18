#!/bin/bash
  
# Clone the repository sample-nodejs-app.
git clone https\://github.com/komal-gogi/sample-nodejs-app
cd sample-nodejs-app

# Build the docker image.
docker-compose build
echo -e '\n\n'

# Initializing Docker swarm.
docker swarm init
echo -e '\n\n'

# We can join manager node to worker using "docker swarm join --token ip" command.

# Deploying docker swarm for single node using docker-compose.yml file.
docker stack deploy -c docker-compose.yml swarmnodeapp
echo -e "\nservices created .........\n\n"

# List the docker services and check for the created container
docker service ls
echo -e '\n\n'

# If the message queue is equal or greater then a certain threshold value,
# Docker swarm will scale up the containers.
queue_msg=5
if [ $queue_msg -eq 5 ]
then 
    docker service scale swarmnodeapp_nodejs=10
fi

# Similarly if queue threshold is below give value then,
# Docker swarm will scale down the conatiners.

echo -e '\n\n'
docker service ls
