// GAIH-SPACE - Satellite over Liberia tracker
const express = require('express');
const app = express();

app.get('/api/space/over-liberia', (req, res) => {
  res.json({
    ground_station: 'Monrovia 6.30N, -10.79W',
    satellites: [
      { name: 'STARLINK-1023', elevation: '45deg', speed: '7.5km/s', internet: '180Mbps' },
      { name: 'ISS', elevation: '12deg', next_pass: 'Tonight 7:12PM' },
      { name: 'NOAA-19', action: 'Downloading weather image for Farm AI' }
    ],
    best_for_internet: 'STARLINK-1023',
    powered_by: '1989SHACK GAIH-SPACE'
  });
});

app.listen(7000);