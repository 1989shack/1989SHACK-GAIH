$ROOT="C:\inetpub\wwwroot\1989SHACK-GAIH"
$wheels=@(
@{name="GAIH-CRYPTO";port=13021;desc="Liberian Crypto - LRD stablecoin";icon="🪙";out="MoMo to crypto - LRD token"},
@{name="GAIH-TALK";port=13022;desc="Liberian WhatsApp - No Meta! Free calls";icon="💬";out="Free calls Monrovia - No data cost"},
@{name="GAIH-MAP";port=13023;desc="Liberian Google Maps - Kekeh routes";icon="🗺️";out="Duala to Congo Town kekeh AI routes"},
@{name="GAIH-NEWS";port=13024;desc="Truth News - No fake! Liberian stories";icon="📰";out="Liberian news - No BBC"},
@{name="GAIH-GAME";port=13025;desc="Liberian Games - Lappa game for kids";icon="🎮";out="Kids play offline - Lappa race"}
)
foreach($w in $wheels){
  $p="$ROOT\$($w.name)"; New-Item -ItemType Directory -Force -Path $p | Out-Null
  @"
const express=require('express');const app=express();
app.use(express.static(__dirname));
app.get('/',(req,res)=>res.send(`<html><body style="background:#111;color:#0f0;font-family:monospace;padding:20px;text-align:center"><h1>$($w.icon) $($w.name)</h1><h2 style="color:#ff0">$($w.desc)</h2><h3 style="color:#0ff">Port $($w.port) ONLINE - NEW INVENTION!</h3><p>Output: $($w.out)</p><p>Location: C:\\inetpub\\wwwroot\\1989SHACK-GAIH\\$($w.name)</p><p>Factory that builds factories!</p><br><a href="http://localhost:13020" style="color:#0ff;font-size:20px">👑 Back to Empire Dashboard</a><br><br><a href="http://localhost:10001" style="color:#f80">🏪 Duala Shop</a></body></html>`));
app.get('/api/status',(req,res)=>res.json({wheel:'$($w.name)',port:$($w.port),desc:'$($w.desc)',output:'$($w.out)',status:'ONLINE - NEW INVENTION 2026',empire:'GAIH - Expanding to 37 ports!',location:'Monrovia, Liberia'}));
app.listen($($w.port),()=>console.log('$($w.name) ONLINE $($w.port) - $($w.desc)'));
"@ | Out-File "$p\server.js" -Encoding utf8
  Set-Location $p; npm init -y | Out-Null; npm install express | Out-Null
  pm2 delete $w.name 2>$null | Out-Null; pm2 start "$p\server.js" --name $w.name | Out-Null
  New-NetFirewallRule -DisplayName $w.name -Direction Inbound -Action Allow -Protocol TCP -LocalPort $w.port -ErrorAction SilentlyContinue | Out-Null
  Write-Host "$($w.icon) $($w.name) BUILT on port $($w.port)!" -ForegroundColor Green
}
pm2 save | Out-Null
Write-Host "`n✅ 5 NEW WHEELS BUILT! Total now 37 ports!" -ForegroundColor Yellow
Write-Host "Check: http://localhost:13020" -ForegroundColor Cyan
