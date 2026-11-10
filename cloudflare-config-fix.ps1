# ========== GAIHP - ONE TIME PUSH ALL LIVE - BLOOD BROTHERS - MONROVIA ==========
# Backbone: 1989shack.com | bloodbrothers.net | lifeinternationalschool.lr | stmathew.lr
Write-Host "=== GAIHP ONE TIME PUSH START ===" -ForegroundColor Green

# 1. GO TO BASE
cd C:\inetpub\wwwroot\1989SHACK-GAIH
if (!(Test-Path GAIH-SCHOOL)) { mkdir GAIH-SCHOOL }
if (!(Test-Path GAIH-CLIENT)) { mkdir GAIH-CLIENT }
if (!(Test-Path GAIH-FACTORY)) { mkdir GAIH-FACTORY }

# 2. SCHOOL - Port 3001 - Students / Teachers / Admins
@"
const http=require('http');
const users={'student1':{pass:'student123',role:'STUDENT',name:'Liberia Student'},'teacher1':{pass:'teacher123',role:'TEACHER',name:'Liberia Teacher'},'admin1':{pass:'admin123',role:'ADMIN',name:'Mrs. Sheriff - Admin'}};
http.createServer((req,res)=>{
if(req.url==='/login'){let b='';req.on('data',c=>b+=c);req.on('end',()=>{const p=new URLSearchParams(b);const u=users[p.get('user')];if(u&&u.pass===p.get('pass')){res.end('<h1>WELCOME '+u.role+' - '+u.name+'</h1><p>GAIHP School Portal - Monrovia - lifeinternationalschool.lr - stmathew.lr</p><a href=\"/\">Logout</a>')}else{res.end('<h1>Wrong Login</h1><a href=\"/\">Back</a>')}});return;}
res.end('<h1>GAIHP SCHOOL PORTAL - 1989SHACK</h1><p>Global Architecture Infrastructure Hosting Platform</p><p>Schools: lifeinternationalschool.lr | stmathew.lr | All Liberia Schools</p><form method=\"POST\" action=\"/login\">Username: <input name=\"user\" /><br><br>Password: <input type=\"password\" name=\"pass\" /><br><br><button>Login</button></form><p>Demo: student1 / teacher1 / admin1</p>');
}).listen(3001,()=>console.log('GAIH-SCHOOL REAL on 3001'));
"@ | Out-File -Encoding utf8 GAIH-SCHOOL\server.js

# 3. CLIENT - Port 3002 - cPanel + Support Ticket
@"
const http=require('http');let tickets=[];
http.createServer((req,res)=>{
if(req.url==='/ticket'&&req.method==='POST'){let b='';req.on('data',c=>b+=c);req.on('end',()=>{const p=new URLSearchParams(b);tickets.push({name:p.get('name'),msg:p.get('msg'),time:new Date().toLocaleString()});res.end('<h1>TICKET RECEIVED - GAIHP SUPPORT</h1><p>Thank you '+p.get('name')+'. Monrovia team will reply.</p><a href=\"/\">Back</a>')});return;}
if(req.url==='/admin'){let l=tickets.map(t=>'<li><b>'+t.name+'</b> - '+t.time+' - '+t.msg+'</li>').join('');res.end('<h1>GAIHP ADMIN - SUPPORT TICKETS</h1><ul>'+(l||'<li>No tickets</li>')+'</ul><a href=\"/\">Back</a>');return;}
res.end('<h1>GAIHP cPANEL HOSTING - 1989shack.com</h1><p>Backbone Domain: 1989shack.com | bloodbrothers.net</p><p>Domain: 1989shack.com | Disk: 10GB | Status: ONLINE</p><h2>Client Support - Open Ticket</h2><form method=\"POST\" action=\"/ticket\">Name: <input name=\"name\" /><br><br>Problem: <input name=\"msg\" /><br><br><button>Send Ticket</button></form><p><a href=\"/admin\">Admin - View Tickets</a></p>');
}).listen(3002,()=>console.log('GAIH-CLIENT REAL on 3002'));
"@ | Out-File -Encoding utf8 GAIH-CLIENT\server.js

# 4. FACTORY - Port 3003 - What We Built
@"
const http=require('http');
http.createServer((req,res)=>{res.end('<h1>GAIHP FACTORY - BUILT TODAY - MONROVIA</h1><p>Global Architecture Infrastructure Hosting Platform - Factory Software</p><ul><li>GAIH-DRIVE - 8000 - ONLINE - Files</li><li>GAIH-SCHOOL - 3001 - ONLINE - Students/Teachers/Admins</li><li>GAIH-CLIENT - 3002 - ONLINE - cPanel + Support</li><li>GAIH-FACTORY - 3003 - ONLINE - This Page</li><li>GAIH-ARMY - ONLINE - Security</li></ul><p>Backbone: 1989shack.com | bloodbrothers.net | lifeinternationalschool.lr | stmathew.lr</p><p>Built by Blood Brothers - For Liberia - Africa - World - For Mrs. Victoria K. Bangalu Sheriff</p>')}).listen(3003,()=>console.log('GAIH-FACTORY REAL on 3003'));
"@ | Out-File -Encoding utf8 GAIH-FACTORY\server.js

# 5. START ALL WITH PM2
pm2 delete all
pm2 start GAIH-SCHOOL\server.js --name GAIH-SCHOOL
pm2 start GAIH-CLIENT\server.js --name GAIH-CLIENT
pm2 start GAIH-FACTORY\server.js --name GAIH-FACTORY
pm2 list
pm2 save
Write-Host "=== PM2 ALL STARTED ===" -ForegroundColor Cyan

# 6. CLOUDFLARE CONFIG - FIX 4x100 FOREVER - NO NOTEPAD
cd C:\Users\Admin\.cloudflared
$TUNNEL_ID = "db31ad12-046d-4c20-a900-0c72cc02c557"
@"
tunnel: $TUNNEL_ID
credentials-file: C:\Users\Admin\.cloudflared\$TUNNEL_ID.json
protocol: http2
ingress:
    - hostname: app.1989shack.com
    service: http://localhost:80
    - hostname: 1989shack.com
    service: http://localhost:80
    - hostname: bloodbrothers.net
    service: http://localhost:80
    - hostname: lifeinternationalschool.lr
    service: http://localhost:3001
    - hostname: stmathew.lr
    service: http://localhost:3001
    - service: http_status:404
"@ | Out-File -Encoding utf8 config.yml
Write-Host "config.yml CREATED - Check:" -ForegroundColor Yellow
type config.yml
Write-Host "=== NOW RUN IN NEW POWERSHELL: cloudflared tunnel run gaihp ===" -ForegroundColor Green
Write-Host "=== ALL GAIHP LIVE ===" -ForegroundColor Green