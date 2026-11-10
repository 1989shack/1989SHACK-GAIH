# QR + Program — For Mrs. Victoria K. Bangalu Sheriff — With Love — For Dec 12
cd C:\inetpub\wwwroot\1989SHACK-GAIH
New-Item -Path "live/qr" -ItemType Directory -Force
# Use QR API — Free — No module needed — For Global Users — $1 Data
Invoke-WebRequest -Uri "https://api.qrserver.com/v1/create-qr-code/?size=500x500&data=https://mommy.1989shack-gaih.lr/" -OutFile "live/qr/mommy-office-qr.png"
Invoke-WebRequest -Uri "https://api.qrserver.com/v1/create-qr-code/?size=500x500&data=https://victoria-k-bangalu-sheriff.1989shack-gaih.lr/" -OutFile "live/qr/victoria-k-honor-qr.png"
Invoke-WebRequest -Uri "https://api.qrserver.com/v1/create-qr-code/?size=500x500&data=https://mama-victoria-bangalu-sheriff-memorial.1989shack-gaih.lr/" -OutFile "live/qr/memorial-qr.png"
Invoke-WebRequest -Uri "https://api.qrserver.com/v1/create-qr-code/?size=500x500&data=https://heart.1989shack-gaih.lr/" -OutFile "live/qr/heart-protection-qr.png"
wrangler pages deploy live/qr --project-name=qr-codes-mommy
Write-Host "✅ QR CODES LIVE — https://qr-codes-mommy.pages.dev/ — For Funeral Program — For Mrs. Victoria K. Bangalu Sheriff — With Love — 💜" -ForegroundColor Green