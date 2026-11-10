# ===== 1989SHACK - DEPLOY ALL TONIGHT =====
cd C:\inetpub\wwwroot

# 1. Make all deploy folders
@("GAIH-NET","GAIH-AI","GAIH-PAY","GAIH-STORE","GAIH-SPACE","GAIH-TRAFFIC") | ForEach-Object { New-Item -ItemType Directory -Force -Path "C:\inetpub\wwwroot\$_" | Out-Null }

# 2. Copy real files we have to server.js
Copy-Item "C:\inetpub\wwwroot\GAINT-NET.js" -Destination "C:\inetpub\wwwroot\GAIH-NET\server.js" -Force
Copy-Item "C:\inetpub\wwwroot\GAIH-AI.js" -Destination "C:\inetpub\wwwroot\GAIH-AI\server.js" -Force
Copy-Item "C:\inetpub\wwwroot\GAIH-PAY.js" -Destination "C:\inetpub\wwwroot\GAIH-PAY\server.js" -Force
Copy-Item "C:\inetpub\wwwroot\GAIH-STORE.js" -Destination "C:\inetpub\wwwroot\GAIH-STORE\server.js" -Force
Copy-Item "C:\inetpub\wwwroot\GAIH-SPACE.js" -Destination "C:\inetpub\wwwroot\GAIH-SPACE\server.js" -Force
Copy-Item "C:\inetpub\wwwroot\GAIH-TRAFFIC.js" -Destination "C:\inetpub\wwwroot\GAIH-TRAFFIC\server.js" -Force

# 3. Install express in each
@("GAIH-NET","GAIH-AI","GAIH-PAY","GAIH-STORE","GAIH-SPACE","GAIH-TRAFFIC") | ForEach-Object {
  Set-Location "C:\inetpub\wwwroot\$_"
  npm init -y | Out-Null
  npm install express | Out-Null
  Write-Host "✅ $_ ready"
}

# 4. Install pm2 once
npm install -g pm2

# 5. Start ALL
pm2 delete all
pm2 start C:\inetpub\wwwroot\GAIH-NET\server.js --name "GAIH-NET"
pm2 start C:\inetpub\wwwroot\GAIH-AI\server.js --name "MAMA-AI"
pm2 start C:\inetpub\wwwroot\GAIH-PAY\server.js --name "GAIH-PAY"
pm2 start C:\inetpub\wwwroot\GAIH-STORE\server.js --name "GAIH-STORE"
pm2 start C:\inetpub\wwwroot\GAIH-SPACE\server.js --name "GAIH-SPACE"
pm2 start C:\inetpub\wwwroot\GAIH-TRAFFIC\server.js --name "GAIH-TRAFFIC"
pm2 save
pm2 list