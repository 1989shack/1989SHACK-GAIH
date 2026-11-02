# STEP 1 — Run as Admin! Right-click PowerShell → Run as Administrator

# Check your adapters — Show all IPs
ipconfig /all
Write-Host "=== YOUR ADAPTERS ===" -ForegroundColor Green

# Show current IP for Host-Only and WiFi
Get-NetIPAddress | Where-Object {$_.IPAddress -like "192.168.*"} | Format-Table IPAddress, InterfaceAlias

# STEP 2 — Enable Mobile Hotspot via PowerShell (GAIH-NET)
# This creates WiFi "GAIH-NET" password "1989SHACK"
Write-Host "=== ENABLING GAIH-NET HOTSPOT ===" -ForegroundColor Yellow
# Windows 11 Hotspot — Manual enable first time via GUI, then PowerShell can toggle:
# Settings → Network → Mobile Hotspot → ON → Share: Wi-Fi → Name: GAIH-NET → Password: 1989SHACK

# Alternative PowerShell — Create Hosted Network (works offline!)
netsh wlan set hostednetwork mode=allow ssid=GAIH-NET key=1989SHACK keyUsage=persistent
netsh wlan start hostednetwork

# Check hotspot started
netsh wlan show hostednetwork

# STEP 3 — Check ICS — Set Ethernet 4 to 192.168.137.1
Write-Host "=== SETTING HOST-ONLY TO 192.168.137.1 ===" -ForegroundColor Cyan
New-NetIPAddress -InterfaceAlias "Ethernet 4" -IPAddress 192.168.137.1 -PrefixLength 24 -ErrorAction SilentlyContinue
# If exists, remove old and set:
# Remove-NetIPAddress -InterfaceAlias "Ethernet 4" -Confirm:$false -ErrorAction SilentlyContinue
# New-NetIPAddress -InterfaceAlias "Ethernet 4" -IPAddress 192.168.137.1 -PrefixLength 24

# STEP 4 — Allow our 51 ports through Firewall — IMPORTANT!
Write-Host "=== OPENING 51 GAIH PORTS IN FIREWALL ===" -ForegroundColor Magenta
$ports = @(3000,6000,10001,12000,13020,13021,13022,13023,13024,13025,13026,13027,13028,13029,13030,13031,13032,13033,13034,13035,13036,13037,13038,13039,1700,1701,1702,1703,1704,1705,1706,1707,1708)
foreach ($port in $ports) {
    New-NetFirewallRule -DisplayName "GAIH-PORT-$port" -Direction Inbound -LocalPort $port -Protocol TCP -Action Allow -ErrorAction SilentlyContinue
    Write-Host "Port $port opened" -ForegroundColor Green
}

# STEP 5 — Check all 51 ports listening
Write-Host "=== CHECKING 51 PORTS ===" -ForegroundColor Yellow
pm2 list
Get-NetTCPConnection -LocalPort 13020,10001,13039,12000 -ErrorAction SilentlyContinue | Format-Table LocalAddress, LocalPort, State

# STEP 6 — Test Duala Market URLs — Should open browser!
Write-Host "=== DUALA MARKET TEST — OPENING EMPIRE ===" -ForegroundColor Green
Start-Process http://localhost:13020
Start-Process http://192.168.137.1:13020
Start-Process http://192.168.137.1:10001
Start-Process http://192.168.137.1:13039
Start-Process http://192.168.137.1:12000

# Show IP for phones to connect:
Write-Host "`n=== GIVE THIS TO DUALA MARKET PHONES ===" -ForegroundColor Red -BackgroundColor White
Write-Host "WiFi Name: GAIH-NET" -ForegroundColor Yellow
Write-Host "Password: 1989SHACK" -ForegroundColor Yellow
Write-Host "Open in phone browser: http://192.168.137.1:10001" -ForegroundColor Green
Write-Host "Shop Dashboard: http://192.168.137.1:13020" -ForegroundColor Green
Write-Host "Brother Home: http://192.168.137.1:13039" -ForegroundColor Magenta
ipconfig | findstr "192.168.137"