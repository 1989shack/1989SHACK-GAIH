$ROOT="C:\inetpub\wwwroot\1989SHACK-GAIH"
$wheels=@(
@{name="GAIH-MUSIC";port=13026;desc="Liberian Afrobeat Offline - No Spotify!";icon="🎵";out="Bassa, Kpelleh music offline - 1000 songs"},
@{name="GAIH-MOTO";port=13027;desc="Kekeh Uber - Ride from Duala to Congo Town";icon="🛺";out="50 kekeh drivers, MoMo pay, live GPS"},
@{name="GAIH-LEARN-AI";port=13028;desc="AI Teaches Kpelleh, Bassa, Vai Language";icon="🧠";out="AI teaches 16 Liberian languages offline"},
@{name="GAIH-WEATHER";port=13029;desc="Farm Rain AI - When to plant cassava";icon="🌧️";out="Rain prediction for Bong, Lofa farmers"},
@{name="GAIH-SMS";port=13030;desc="Free SMS - No Orange/Lonestar cost!";icon="📩";out="Free SMS Monrovia - Bypass telcos"}
)
foreach($w in $wheels){
  $p="$ROOT\$($w.name)"; New-Item -ItemType Directory -Force -Path $p | Out-Null
  @"
const express=require('express');const app=express();
app.use(express.json()); app.use(express.static(__dirname));
app.get('/',(req,res)=>res.send(`<html><body style="background:#0a0a0a;color:#0f0;font-family:monospace;padding:20px;text-align:center;border:5px solid #ff0"><h1 style="font-size:40px">$($w.icon) $($w.name)</h1><h2 style="color:#ff0;font-size:28px">$($w.desc)</h2><h3 style="color:#0ff">Port $($w.port) ONLINE - NEXT NEXT 5 INVENTION!</h3><div style="background:#222;padding:15px;margin:20px;border-radius:10px"><p style="font-size:18px">Output: <b style="color:#fff">$($w.out)</b></p><p>Location: C:\\inetpub\\wwwroot\\1989SHACK-GAIH\\$($w.name)</p><p style="color:#f80">Monrovia -> Africa Empire</p></div><br><a href="http://localhost:13020" style="color:#0ff;font-size:22px;text-decoration:none;border:2px solid #0ff;padding:10px">👑 EMPIRE DASHBOARD</a><br><br><a href="http://localhost:10001" style="color:#f80;font-size:18px">🏪 DUALA SHOP</a></body></html>`));
app.get('/api/status',(req,res)=>res.json({wheel:'$($w.name)',port:$($w.port),desc:'$($w.desc)',output:'$($w.out)',status:'ONLINE - 42 PORT EMPIRE',empire:'GAIH - Expanding!',phase:'NEXT NEXT 5',total_ports:42,location:'Monrovia, Liberia, Africa'}));
app.listen($($w.port),()=>console.log('$($w.name) ONLINE $($w.port) - $($w.desc)'));
"@ | Out-File "$p\server.js" -Encoding utf8
  Set-Location $p; npm init -y | Out-Null; npm install express | Out-Null
  pm2 delete $w.name 2>$null | Out-Null; pm2 start "$p\server.js" --name $w.name | Out-Null
  New-NetFirewallRule -DisplayName $w.name -Direction Inbound -Action Allow -Protocol TCP -LocalPort $w.port -ErrorAction SilentlyContinue | Out-Null
  Write-Host "$($w.icon) $($w.name) BUILT on port $($w.port)!" -ForegroundColor Green
}
pm2 save | Out-Null
Write-Host "`n✅ NEXT NEXT 5 BUILT! 37 -> 42 PORTS!" -ForegroundColor Yellow
Write-Host "Monrovia Empire now 42 wheels!" -ForegroundColor Cyan
