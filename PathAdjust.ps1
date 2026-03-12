$rootFolder = (Get-Location).Path

Write-Output "Including .DLLs on path..."

if (-not (Test-Path -Path (Join-Path -Path $rootFolder -ChildPath "bin")))
{
    Write-Output "Please run this script from the root of the directory."
}
else 
{
    $env:Path += (Join-Path -Path $rootFolder -ChildPath "bin;")
}

Write-Output "Done."
