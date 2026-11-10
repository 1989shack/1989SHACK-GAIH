const http=require('http');let tickets=[];
http.createServer((req,res)=>{
if(req.url==='/ticket'&&req.method==='POST'){let b='';req.on('data',c=>b+=c);req.on('end',()=>{const p=new URLSearchParams(b);tickets.push({name:p.get('name'),msg:p.get('msg'),time:new Date().toLocaleString()});res.end('<h1>TICKET RECEIVED - GAIHP SUPPORT</h1><p>Thank you '+p.get('name')+'. Monrovia team will reply.</p><a href=\"/\">Back</a>')});return;}
if(req.url==='/admin'){let l=tickets.map(t=>'<li><b>'+t.name+'</b> - '+t.time+' - '+t.msg+'</li>').join('');res.end('<h1>GAIHP ADMIN - SUPPORT TICKETS</h1><ul>'+(l||'<li>No tickets</li>')+'</ul><a href=\"/\">Back</a>');return;}
res.end('<h1>GAIHP cPANEL HOSTING - 1989shack.com</h1><p>Backbone Domain: 1989shack.com | bloodbrothers.net</p><p>Domain: 1989shack.com | Disk: 10GB | Status: ONLINE</p><h2>Client Support - Open Ticket</h2><form method=\"POST\" action=\"/ticket\">Name: <input name=\"name\" /><br><br>Problem: <input name=\"msg\" /><br><br><button>Send Ticket</button></form><p><a href=\"/admin\">Admin - View Tickets</a></p>');
}).listen(3002,()=>console.log('GAIH-CLIENT REAL on 3002'));
