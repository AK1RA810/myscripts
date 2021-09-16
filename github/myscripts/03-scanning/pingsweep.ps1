param($net)
if (!$net) {
    Write-Host "PING SWEEP - BY AK1RA810"
    Write-Output ".\script.ps1 192.168.0"
} else {
    try{
    foreach ($hosts in 1..254) {
       $res = ping -n 1 "$net.$hosts" | Select-String "bytes=32" 
       $res.Line.split(' ')[2] -replace ":",""
    }
  } catch {}
}