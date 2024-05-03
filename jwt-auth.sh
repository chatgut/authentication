#!/bin/bash

# Navigate to the submodule directory
cd jwt_authentication_service || exit

# shellcheck disable=SC2125
ARTIFACT_PATTERN=target/jwt_authentication_service*.jar

# Check if any artifact matching the pattern exists and package only if it doesn't
if ls $ARTIFACT_PATTERN 1> /dev/null 2>&1; then
    echo "Artifact already exists. Skipping Maven package."
else
    echo "Artifact does not exist. Running Maven package."
    mvn package -Dnative
fi

# Build the Docker image
docker build -f src/main/docker/Dockerfile.native -t app/jwt_authentication_service .

# Run the Docker container
docker run -i --rm -p 8080:8080 app/jwt_authentication_service
