cd C:\inetpub\wwwroot\1989SHACK-GAIH
# Install QR Module
Install-Module QRCodeGenerator -Force
# Generate QR Codes — For Mrs. Victoria K. Bangalu Sheriff — With Love — For Funeral Dec 12
New-QRCodeText -Text "https://mommy.1989shack-gaih.lr/" -OutPath "live/qr/mommy-office-qr.png"
New-QRCodeText -Text "https://victoria-k-bangalu-sheriff.1989shack-gaih.lr/" -OutPath "live/qr/victoria-k-honor-qr.png"
New-QRCodeText -Text "https://mama-victoria-bangalu-sheriff-memorial.1989shack-gaih.lr/" -OutPath "live/qr/memorial-qr.png"
New-QRCodeText -Text "https://heart.1989shack-gaih.lr/" -OutPath "live/qr/heart-protection-qr.png"
Write-Host "✅ QR CODES — For Mrs. Victoria K. Bangalu Sheriff — For Funeral Program — With Love — 💜"