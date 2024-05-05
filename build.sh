#!/bin/bash

echo "Starting  All Docker Builds"
echo "----Please use ony for development----"

# Build H&S Image
cd hashing_service || exit
docker build -f Dockerfile -t app/hashing-salting .
cd ..


# Build JWT Auth Image
cd jwt_authentication_service || exit
ARTIFACT_PATTERN=target/jwt_authentication_service*.jar
if ls $ARTIFACT_PATTERN 1> /dev/null 2>&1; then
    echo "Artifact already exists. Skipping Maven package."
else
    echo "Artifact does not exist. Running Maven package."
    mvn package -Dnative
fi
docker build -f src/main/docker/Dockerfile.native -t app/jwt-auth .
cd ..

# Build Frontend Image
cd authentication_page_service || exit
docker build -f Dockerfile -t app/frontend .
cd ..

# Build PostGreSQL Image
cd postgresql_docker || exit
docker build -t app/database-postgresql .
cd ..

echo "Done"
