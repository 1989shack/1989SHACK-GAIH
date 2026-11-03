cd C:\inetpub\wwwroot\1989SHACK-GAIH\live\Africa-Protection
# Add blockchain audit + live rates API
wrangler pages deploy . --project-name=cbl-blockchain-rates
# Cloudflare → Custom domain → cbl.1989shack-gaih.lr + rates.1989shack-gaih.lr + blockchain.1989shack-gaih.lr → Live — For CBL — For economy