const http = require('http');
const SECRET = "1989SHACK_DUALA_2026";

http.createServer((req,res)=>{
  const token = req.headers['x-shack-token'];
  if(token !== SECRET){
    res.writeHead(403); 
    return res.end("BLOCKED - No 1989SHACK pass - But gateway alive");
  }
  console.log(`[GAIH] ${req.socket.remoteAddress} -> ${req.url}`);
  res.writeHead(200);
  res.end("GAIH GATEWAY OK - Access granted");
}).listen(10001, '0.0.0.0', ()=> {
  console.log("Gateway running on 0.0.0.0:10001");
  console.log("Test: http://localhost:10001");
  console.log("Test: http://192.168.137.1:10001 when hotspot ON");
});