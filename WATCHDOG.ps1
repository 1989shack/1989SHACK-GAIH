# WATCHDOG - Self-Rebuild System
while($true){
  $services = pm2 list --no-color | Select-String "GAIH-"
  foreach($line in $services){
    if($line -match "errored|stopped"){
      $name = ($line -split "\s+")[1]
      Write-Host "WHEEL $name CRASHED! SELF-REBUILDING..." -ForegroundColor Red
      pm2 restart $name
    }
  }
  # Self-deploy new wheels from GitHub if new code pushed!
  # git pull origin main; if new folder, pm2 start it!
  Start-Sleep -Seconds 10
}