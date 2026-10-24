$ErrorActionPreference = "Stop"

Write-Host "Checking Azure login..."

$accountJson = az account show --output json

if ($LASTEXITCODE -ne 0) {
    Write-Error "Azure login failed."
    exit 1
}

$accountDetails = $accountJson | ConvertFrom-Json

Write-Host "Azure login successful."
Write-Host "Subscription Name: $($accountDetails.name)"
Write-Host "Subscription ID: $($accountDetails.id)"
Write-Host "Tenant ID: $($accountDetails.tenantId)"