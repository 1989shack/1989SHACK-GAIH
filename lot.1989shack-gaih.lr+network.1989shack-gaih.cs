# PowerShell Full Authority — Connect any device/network 🛜 to our 100 domains — Free — Today
Import-Module C:\inetpub\wwwroot\1989SHACK-GAIH\1989SHACK-GAIH-Global-Platform.psm1

# Invent IoT Network — Connect 5 things today — To our domains — Free
cloudflared tunnel create iot-network-1989shack
cloudflared tunnel route dns iot-network-1989shack iot.1989shack-gaih.lr
cloudflared tunnel route dns iot-network-1989shack network.1989shack-gaih.lr
cloudflared tunnel route dns iot-network-1989shack api.1989shack-gaih.lr

# Now any device — Connects to https://iot.1989shack-gaih.lr — Free — Network 🛜 — Across globe — Invented today