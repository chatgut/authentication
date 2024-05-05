#!/bin/bash

authNetwork=`docker network ls | grep auth-net | wc -l`
authNetwork=$(($authNetwork + 0))

if [[ $authNetwork = "0" ]]
then
  docker network create --driver bridge auth-net
fi

docker run -dit --memory 128m --network auth-net --name postgress-database -e POSTGRES_PASSWORD=root -p 5432:5432 app/database-postgresql
