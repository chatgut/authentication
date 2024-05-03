#!/bin/bash

# Navigate to the submodule directory
cd hashing_service || exit

# Build the Docker image
docker build -f Dockerfile -t app/hashing_service .

# Run the Docker container
docker run -i --rm -p 8888:8888 app/hashing_service