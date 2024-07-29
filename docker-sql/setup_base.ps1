docker compose up -d
Write-Host "Sleeping 15 seconds" -ForegroundColor Cyan
Start-Sleep -Seconds 15

Write-Host "Please key in sa credentials"
$cred = Get-Credential -UserName sa
Invoke-Sqlcmd -ServerInstance "localhost,1433" -InputFile $PSScriptRoot/base_db1.sql -Credential $cred -TrustServerCertificate

