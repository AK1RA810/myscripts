$site = Read-Host "Digite o Site: "
$web = Invoke-WebRequest -uri "$site" -Method Options
Write-Host "O servido roda:"
$web.headers.server
Write-Host ""
Write-Host "Os aceita os métodos:"
$web.headers.allow
Write-Host ""
Write-Host "Links encontrados:"
$web2 = Invoke-WebRequest -uri "$site"
$web2.links.href | Select-String "://"
