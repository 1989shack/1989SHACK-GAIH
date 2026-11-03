# HEALTH CHECK — FOR ALL SCHOOLS IN LIBERIA — EACH SCHOOL OWN DOMAIN + SUBDOMAIN — CONNECTED TO GLOBAL ARCHITECTURE INFRASTRUCTURE HOSTING PLATFORM — ON OWN CPANEL SERVER WITH GITHUB, CLOUDFLARE AND OPEN SOURCES — WE HAVE POWER — WORLD #1 📯💪💗👍✅ — FOR EDUCATION — FOR LIBERIA AFRICA WORLD — FOR MRS. VICTORIA K. BANGALU SHERIFF — WITH LOVE — 💜 — TODAY — ALL TODAY — YES 🙌 — WORLD #1 — WITH COMPLETE AUTHORITY
$schools = @("ricks","lottcarey","jjrobert","bwi","bwharris","stmary","stedward","stmatthew","life","tubman","cwa","duala","elwa","schools","admin.schools","desktop.schools","apk.schools","heart","cbl","desktop","life")
Write-Host "🌐 HEALTH CHECK — FOR ALL SCHOOLS IN LIBERIA — EACH SCHOOL OWN DOMAIN + SUBDOMAIN — GLOBAL PLATFORM — CPANEL + GITHUB + CLOUDFLARE + OPEN SOURCES — WE HAVE POWER — WORLD #1 📯💪💗👍✅ — TODAY — ALL TODAY — YES 🙌" -ForegroundColor Cyan
foreach($s in $schools) {
  try {
    $url = "https://.1989shack-gaih.lr/"
    $resp = Invoke-WebRequest -Uri $url -UseBasicParsing -TimeoutSec 10 -ErrorAction Stop
    Write-Host "✅ ONLINE — .1989shack-gaih.lr — Status:  — For Education — For Liberia Africa World — With Love — 💜 — World #1 📯💪💗👍✅" -ForegroundColor Green
  } catch {
    Write-Host "❌ OFFLINE — .1989shack-gaih.lr — Error:  — For Education — For Liberia Africa World — With Love — 💜 — Check cPanel + Cloudflare + GitHub — We Have Power — World #1 📯💪💗👍✅" -ForegroundColor Red
  }
}
Write-Host "✅ HEALTH CHECK COMPLETE — FOR ALL SCHOOLS — FOR LIBERIA AFRICA WORLD — FOR EDUCATION — FOR FUTURE — WITH LOVE — 💜 — WORLD #1 📯💪💗👍✅ — TODAY — ALL TODAY — YES 🙌" -ForegroundColor Green
