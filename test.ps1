$githubUrl = 'https://github.com/libsdl-org/SDL/releases/download/release-2.32.10/SDL2-devel-2.32.10-mingw.zip'
$rootFolder = (Get-Location).Path
$tmpFolder = Join-Path -Path $rootFolder -ChildPath "tmp"
$zipFilePath = Join-Path -Path $tmpFolder -ChildPath "SDL.zip"
$folderStructure = Join-Path -Path $tmpFolder -ChildPath "SDL2-2.32.10\x86_64-w64-mingw32"

if (-not (Test-Path -Path $tmpFolder)) {
    New-Item -ItemType Directory -Path $tmpFolder | Out-Null
    Write-Output "Created 'tmp' folder at: $tmpFolder"
} else {
    Write-Output "'tmp' folder already exists at: $tmpFolder"
}


try {
    # Download the ZIP file
    Write-Output "Downloading ZIP file from $url..."
    Invoke-WebRequest -Uri $githubUrl -OutFile $zipFilePath
    Write-Output "Download complete."

    # Verify the file exists before trying to extract
    if (Test-Path -Path $zipFilePath) {
        Write-Output "Extracting files to root folder: $rootFolder..."
        
        # Unzip the contents into the root folder
        # The -Force flag will overwrite files with the same name if they already exist
        Expand-Archive -Path $zipFilePath -DestinationPath $rootFolder
        
        Write-Output "Extraction complete."
    }
}
catch {
    Write-Error "An error occurred during the download or extraction process: $_"
}

# Uncomment the next two lines if you want to automatically delete the tmp folder and the zip file after extraction
#Remove-Item -Path $tmpFolder -Recurse -Force
#Write-Output "Cleaned up the temporary folder."


