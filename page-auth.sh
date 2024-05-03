#!/bin/bash

# Navigate to the submodule directory
cd authentication_page_service || exit

# Build the Docker image
docker build -f Dockerfile -t app/frontend .

# Run the Docker container
docker run -i --rm -p 3000:3000 app/frontend
