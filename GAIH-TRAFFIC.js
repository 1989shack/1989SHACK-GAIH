// GAIH-TRAFFIC - Live View for LNP
const express = require('express');
const http = require('http');
const WebSocket = require('ws');

const app = express();
const server = http.createServer(app);
const wss = new WebSocket.Server({ server });

// Broadcast traffic every 3 seconds to police
setInterval(() => {
  const liveData = {
    intersection: "Broad-Randall",
    vehicles: Math.floor(Math.random()*50),
    status: ["RED","GREEN","YELLOW"][Math.floor(Math.random()*3)],
    timestamp: new Date(),
    source: "GAIH-SPACE SATLINK"
  };
  
  wss.clients.forEach(client => {
    client.send(JSON.stringify(liveData));
  });
}, 3000);

wss.on('connection', ws => {
  console.log('LNP Officer connected to live view!');
});

server.listen(4000, () => console.log('LNP Live View on ws://localhost:4000'));