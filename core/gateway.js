// C:\inetpub\wwwroot\1989SHACK-GAIH\core\gateway.js
const http = require('http');
const SECRET = "1989SHACK_DUALA_2026";

http.createServer((req,res)=>{
  const token = req.headers['x-shack-token'];
  if(token !== SECRET){
    res.writeHead(403); 
    return res.end("BLOCKED - No 1989SHACK pass");
  }
  // Allow + log
  console.log(`[GAIH] ${req.socket.remoteAddress} -> ${req.url}`);
  res.writeHead(200);
  res.end("GAIH GATEWAY OK - Access granted to 1989SHACK");
}).listen(10001, '192.168.137.1', ()=> console.log("Gateway running on 192.168.137.1:10001"));