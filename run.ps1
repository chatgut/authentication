Write-Host "Starting Docker run"
Write-Host "----Please use only for development----"

function RunImageScript {
    Param(
        [string]$path
    )
    Set-Location -Path $path -ErrorAction Stop
    try {
        & "./run.sh"
    } catch {
        Write-Host "Failed to run script in $path"
        Exit
    }
    Set-Location -Path ..
}

# RUN H&S Image
RunImageScript -path "hashing_service"

# RUN JWT Auth Image
RunImageScript -path "jwt_authentication_service"

# RUN Frontend Image
RunImageScript -path "authentication_page_service"

# RUN PostGreSQL Image
RunImageScript -path "postgresql_docker"

Write-Host "Done"
