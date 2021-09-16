param($ip)
if (!$ip) {
    Write-Host "PORTSCAN - BY AK1RA810"
    Write-Host ".\script.ps1"
} else {
    $topports = 21,22,23,25,110,111,80,8080,3306,445,443,139,2049
    try{    foreach ($ports in $topports) {
            if (Test.NetConnection "$ip" -Port "$ports" -WarningAction SilentlyContinue -InformationLevel Quiet) {
            Write-Host "Porta $ports Aberta"
            } else {
                Write-Host "Porta $ports Fechada"
            }
          } 
    } catch {}
}