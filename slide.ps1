# Stop execution immediately if any command fails
$ErrorActionPreference = "Stop"

Write-Host "Installing dependencies..."
npm install

Write-Host "Starting Slidev server on port 3030..."
npm run dev