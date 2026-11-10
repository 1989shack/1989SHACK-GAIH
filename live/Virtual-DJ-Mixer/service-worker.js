const CACHE='1989shack-gaih-v1';
const URLS=['/live/Virtual-DJ-Mixer/','/live/Virtual-DJ-Mixer/index.html','/live/Virtual-DJ-Mixer/manifest.json'];
self.addEventListener('install',e=>{e.waitUntil(caches.open(CACHE).then(c=>c.addAll(URLS)))});
self.addEventListener('fetch',e=>{e.respondWith(caches.match(e.request).then(r=>r||fetch(e.request)))});