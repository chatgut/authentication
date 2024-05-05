#!/bin/bash
echo "Starting Docker run"
echo "----Please use only for development----"

# Function to set permissions and run the script
run_service() {
    cd "$1" || exit
    chmod +x ./run.sh  # Set execute permission
    ./run.sh
    cd ..
}

# RUN H&S Image
run_service "hashing_service"

# RUN JWT Auth Image
run_service "jwt_authentication_service"

# RUN Frontend Image
run_service "authentication_page_service"

# RUN PostGreSQL Image
run_service "postgresql_docker"

echo "Done"
