Write-Host "Starting All Docker Builds"
Write-Host "Please use only for development"

# Build H&S Image
Set-Location -Path hashing_service -ErrorAction Stop
docker build -f Dockerfile -t app/hashing-salting .
Set-Location -Path ..

# Build JWT Auth Image
Set-Location -Path jwt_authentication_service -ErrorAction Stop
$ARTIFACT_PATTERN = "target/jwt_authentication_service*.jar"
if (Test-Path $ARTIFACT_PATTERN)
{
    Write-Host "Artifact already exists. Skipping Maven package."
}
else
{
    Write-Host "Artifact does not exist. Running Maven package."
    mvn package -Dnative
}
docker build -f src/main/docker/Dockerfile.native -t app/jwt-auth .
Set-Location -Path ..

# Build Frontend Image
Set-Location -Path authentication_page_service -ErrorAction Stop
docker build -f Dockerfile -t app/frontend .
Set-Location -Path ..

Write-Host "Done"