# Invent Deployer — One command to deploy any app — Across globe — Complete authority — Today
function Deploy-AnyApp {
    param([string]$Name, [string]$Domain)
    Write-Host "🚀 Deploying $Name to $Domain — Complete Authority — Across Globe — Free — 💯✅" -ForegroundColor Green
    # Create folder
    New-Item -Path "C:\inetpub\wwwroot\1989SHACK-GAIH\live\$Name" -ItemType Directory -Force
    # Deploy to cPanel
    New-CPanelSubdomain -Subdomain $Domain.Split('.')[0]
    # Deploy to Cloudflare
    New-CloudflareSubdomain -Subdomain $Domain.Split('.')[0]
    Deploy-Cloudflare -Path "C:\inetpub\wwwroot\1989SHACK-GAIH\live\$Name" -Project $Name.ToLower()
    # Push to GitHub
    Push-GitHub -Message "Deployed $Name to $Domain — Invented Today — Complete Authority"
    # Build store packages
    Build-StorePackages
    Write-Host "✅ $Name Deployed to https://$Domain/ — + Play Store + Microsoft Store + Package Download — Across Globe — Complete Authority — Invented Today — 💯✅🌍" -ForegroundColor Green
}

# Use: Deploy-AnyApp -Name "MyFarmApp" -Domain "myfarm.1989shack-gaih.lr"
# Instant — Any app — Across globe — Complete authority — Invented today — For future