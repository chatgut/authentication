docker network create --driver bridge imageapi-net

docker run -dit --memory 128m --network auth-net --name postgress-database -e POSTGRES_PASSWORD=root -p 5432:5432 app/database-postgresql
