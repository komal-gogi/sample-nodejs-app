#!/bin/bash

git clone https://github.com/komal-gogi/sample-nodejs-app
cd sample-nodejs-app
docker stack deploy -c docker-compose.yml swarmnodeapp


