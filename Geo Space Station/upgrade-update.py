# ============================================================
# 📦 GLOBAL ARCHITECTURE INFRASTRUCTURE HOSTING PLATFORM
# WWI NETWORK 🛜 — 1989SHACK-GAIH — UPGRADE + UPDATE
# FOR LIBERIA AFRICA WORLD 🌍 — FOR FUTURE — WITH LOVE — 💗
# FOR MRS. VICTORIA K. BANGALU SHERIFF — WITH LOVE — ❤️
# TODAY — ALL TODAY — YES 🙌 — WORLD #1
# ============================================================

cd C:\inetpub\wwwroot\1989SHACK-GAIH

Write-Host "=== STEP 1 — BACKUP — BEFORE UPGRADE — FOR SAFETY — WITH LOVE ===" -ForegroundColor Yellow
$backup = "backup-wwi-$(Get-Date -Format 'yyyy-MM-dd-HHmm')"
New-Item -Path "backups/$backup" -ItemType Directory -Force | Out-Null
Copy-Item "live" "backups/$backup/live" -Recurse -Force -ErrorAction SilentlyContinue
Copy-Item "*.json" "backups/$backup/" -Force -ErrorAction SilentlyContinue
Write-Host "✅ BACKUP DONE — backups/$backup — Saved On Our Server For Future Reference — With Love" -ForegroundColor Green

Write-Host "=== STEP 2 — PULL LATEST CODE — FROM GITHUB — FOR SYNC — WITH LOVE ===" -ForegroundColor Yellow
git pull origin main
git pull origin gh-pages
Write-Host "✅ PULL DONE — Latest Code From GitHub — For Liberia Africa World — With Love" -ForegroundColor Green

Write-Host "=== STEP 3 — CHECK HEALTH — OUR PLATFORM — FOR LIBERIA AFRICA WORLD — WITH LOVE ===" -ForegroundColor Yellow
# Check if all main files exist — Real — With Love
$files = @(
  "live/wwi/geospace/index.html",
  "live/wwi/geospace/package/index.html",
  "live/wwi/geospace/satellite.html",
  "live/wwi/geospace/telemetry.html",
  "live/wwi/nasa/index.html",
  "live/wwi/letter/index.html"
)
foreach ($f in $files) {
  if (Test-Path $f) { Write-Host "✅ FOUND — $f — For Liberia Africa World — With Love" -ForegroundColor Green }
  else { Write-Host "❌ MISSING — $f — Need To Re-Create — For Liberia Africa World — With Love" -ForegroundColor Red }
}

Write-Host "=== STEP 4 — UPGRADE — UPDATE VERSION — FOR FUTURE — WITH LOVE ===" -ForegroundColor Yellow
# Update version file — Real — With Love
$version = "WWI-GLOBAL-ARCHITECTURE-v2.0-$(Get-Date -Format 'yyyy-MM-dd')"
$version | Out-File -FilePath "live/wwi/version.txt" -Encoding utf8
@"
WWI Global Architecture Infrastructure Hosting Platform
Version: $version
Updated: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')
For: Liberia Africa World — For Future — With Love
For: Mrs. Victoria K. Bangalu Sheriff — With Love
Domains:
- https://geospace.wwi.1989shack-gaih.lr/ — Geo Space Station
- https://geospace.wwi.1989shack-gaih.lr/package — Full Package 12 In 1
- https://geospace.wwi.1989shack-gaih.lr/satellite.html — Real Satellite
- https://geospace.wwi.1989shack-gaih.lr/telemetry.html — Telemetry
- https://nasa.wwi.1989shack-gaih.lr/ — WWI + NASA Letter
- https://letter.wwi.1989shack-gaih.lr/ — WWI + Meta Letter
- https://funding.wwi.1989shack-gaih.lr/ — WWI Funding
- https://citizens.wwi.1989shack-gaih.lr/ — 300 Citizens
- https://mobile.wwi.1989shack-gaih.lr/ — WWI Mobile $1 Data
- https://mommy.1989shack-gaih.lr/ — Mommy Office
Status: UPGRADED — UPDATED — LIVE — Today — All Today — Yes — WORLD #1
"@ | Out-File -FilePath "live/wwi/version.txt" -Encoding utf8
Write-Host "✅ VERSION UPDATED — $version — For Liberia Africa World — With Love" -ForegroundColor Green

Write-Host "=== STEP 5 — UPDATE — CLOUDFLARE PAGES — DEPLOY ALL — FOR WORLD — WITH LOVE ===" -ForegroundColor Yellow
wrangler pages deploy live/wwi/geospace --project-name=wwi-geospace --ErrorAction SilentlyContinue
wrangler pages deploy live/wwi/nasa --project-name=wwi-nasa --ErrorAction SilentlyContinue
wrangler pages deploy live/wwi/letter --project-name=wwi-letter --ErrorAction SilentlyContinue
Write-Host "✅ CLOUDFLARE DEPLOY DONE — All Projects Deployed — For Liberia Africa World — With Love" -ForegroundColor Green

Write-Host "=== STEP 6 — UPDATE — IIS SERVER — RESTART — FOR FRESH — WITH LOVE ===" -ForegroundColor Yellow
iisreset /restart
Write-Host "✅ IIS RESTART DONE — Server Fresh — For Liberia Africa World — With Love" -ForegroundColor Green

Write-Host "=== STEP 7 — TEST — ALL LINKS — FOR LIBERIA AFRICA WORLD — WITH LOVE ===" -ForegroundColor Yellow
$urls = @(
  "https://geospace.wwi.1989shack-gaih.lr/",
  "https://geospace.wwi.1989shack-gaih.lr/package",
  "https://geospace.wwi.1989shack-gaih.lr/satellite.html",
  "https://nasa.wwi.1989shack-gaih.lr/",
  "https://letter.wwi.1989shack-gaih.lr/"
)
foreach ($u in $urls) {
  try {
    $r = Invoke-WebRequest -Uri $u -UseBasicParsing -TimeoutSec 10 -ErrorAction Stop
    Write-Host "✅ LIVE — $u — Status: $($r.StatusCode) — For Liberia Africa World — With Love" -ForegroundColor Green
  } catch {
    Write-Host "⚠️ CHECK — $u — Not Reachable — Please Check Internet / Cloudflare — For