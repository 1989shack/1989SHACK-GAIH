cd C:\inetpub\wwwroot\1989SHACK-GAIH\live\Agriculture-Entomology
# Build farm dashboard — Sensors + Drone feed + Insect detection
wrangler pages deploy . --project-name=agriculture-entomology
# Cloudflare → Custom domain → agriculture.1989shack-gaih.lr + entomology.1989shack-gaih.lr + farm.1989shack-gaih.lr → Live — For farms — For Liberia