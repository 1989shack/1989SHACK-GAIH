# ===== PUSH 3 DOMAINS TONIGHT =====
cd C:\inetpub\wwwroot
@("1989SHACK","LIFE-SCHOOL","WWI-UNIVERSITY") | ForEach-Object { New-Item -ItemType Directory -Force -Path "C:\inetpub\wwwroot\$_" | Out-Null }

# 1989SHACK - Main - Port 8080
Set-Content "C:\inetpub\wwwroot\1989SHACK\server.js" "const express=require('express');const app=express();app.get('/',(req,res)=>res.send('<h1>1989SHACK.com - GAIH-NET + Starlink - Monrovia-1989SHACK - $1 Voucher - Mama AI</h1>'));app.listen(8080,()=>console.log('1989SHACK on 8080'));"
# LIFE SCHOOL - Port 8081
Set-Content "C:\inetpub\wwwroot\LIFE-SCHOOL\server.js" "const express=require('express');const app=express();app.get('/',(req,res)=>res.send('<h1>Life International School .lr - Liberia - Admissions Open</h1>'));app.listen(8081,()=>console.log('LIFE SCHOOL on 8081'));"
# WWI UNIVERSITY - Port 8082
Set-Content "C:\inetpub\wwwroot\WWI-UNIVERSITY\server.js" "const express=require('express');const app=express();app.get('/',(req,res)=>res.send('<h1>WWI University - Liberia Africa World - Future</h1>'));app.listen(8082,()=>console.log('WWI on 8082'));"

# Install + Start all 3
@("1989SHACK","LIFE-SCHOOL","WWI-UNIVERSITY") | ForEach-Object { Set-Location "C:\inetpub\wwwroot\$_"; npm init -y | Out-Null; npm install express | Out-Null }
pm2 start C:\inetpub\wwwroot\1989SHACK\server.js --name "1989SHACK"
pm2 start C:\inetpub\wwwroot\LIFE-SCHOOL\server.js --name "LIFE-SCHOOL"
pm2 start C:\inetpub\wwwroot\WWI-UNIVERSITY\server.js --name "WWI-UNIVERSITY"
pm2 save
pm2 list