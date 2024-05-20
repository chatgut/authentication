# Authentication Documentation

### Services
1. **JWT Authentication Service**: Manages JSON Web Token (JWT) generation and validation.
2. **Hashing Service**: Handles password hashing using secure algorithms.
3. **Authentication Page Service**: Provides the frontend interface for authentication.
4. **Telemetry Service (Jaeger)**: Integrates Jaeger for distributed tracing and telemetry.
   
### Scripts (only if you don't use compose)
- **build.ps1 / build.sh**: Scripts to build the project on Windows and Unix-like systems.
- **run.ps1 / run.sh**: Scripts to run the project on Windows and Unix-like systems.

### Configuration
- **docker-compose.yml**: Docker Compose configuration for containerized deployment.
- **k8s**: Kubernetes deployment configuration files.

### Miscellaneous
- **.gitmodules**: Contains details about Git submodules used.

## Setup Instructions

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/chatgut/authentication.git
   cd authentication
   ```

2. **Initialize Submodules**:
   ```bash
   git submodule update --init --recursive
   ```
   2.1 **Updating Submodules**:
   ```bash
    git submodule update --recursive --remote
   ```
4. **Using Docker**:
   ```bash
   docker-compose up
   ```

## Usage
- **Telemetry**: Access Jaeger's UI at http://localhost:16686 for tracing and telemetry data.
---
![yikes](https://github.com/chatgut/authentication/assets/42122071/0d286c4f-af3f-4a54-a629-79ad56764faf)
