cd C:\inetpub\wwwroot\1989SHACK-GAIH

# Build all AABs for Google Play Store — Same rightful codes — Complete authority — For global users
cd live/iot-network
bubblewrap init --manifest https://iot.1989shack-gaih.lr/manifest.json
bubblewrap build
# Package: com.shackgaih.iot.network — IoT Network — Network 🛜

cd ../ai-heart
bubblewrap init --manifest https://ai.1989shack-gaih.lr/manifest.json
bubblewrap build
# Package: com.shackgaih.ai.heart.mommy — AI Heart — For Mommy — 💜

cd ../cbl-blockchain
bubblewrap init --manifest https://cbl.1989shack-gaih.lr/manifest.json
bubblewrap build
# Package: com.shackgaih.cbl.blockchain — CBL Rates — L$169.50

cd ../farm-entomology
bubblewrap init --manifest https://farm.1989shack-gaih.lr/manifest.json
bubblewrap build
# Package: com.shackgaih.farm.entomology — Farm + Entomology — Entomology = Study of insects

cd ../entroknowty
bubblewrap init --manifest https://entroknowty.1989shack-gaih.lr/manifest.json
bubblewrap build
# Package: com.shackgaih.entroknowty — Entroknowty Learning — Inner knowledge

cd ../global-dj
bubblewrap init --manifest https://globaldjs.1989shack-gaih.lr/manifest.json
bubblewrap build
# Package: com.shackgaih.global.dj — Global DJ Network — For DJs — Global

cd ../deployer
bubblewrap init --manifest https://deployer.1989shack-gaih.lr/manifest.json
bubblewrap build
# Package: com.shackgaih.deployer.global — Global Deployer — Ultimate — One command

# Copy all APKs to downloads — For package download link — For global users — For $1 data
cd ../..
mkdir live/downloads -Force
copy live/iot-network/app-release-signed.apk live/downloads/iot-network-v1.0.apk
copy live/ai-heart/app-release-signed.apk live/downloads/ai-heart-mommy-v1.0.apk
copy live/cbl-blockchain/app-release-signed.apk live/downloads/cbl-blockchain-v1.0.apk
copy live/farm-entomology/app-release-signed.apk live/downloads/farm-entomology-v1.0.apk
copy live/entroknowty/app-release-signed.apk live/downloads/entroknowty-v1.0.apk
copy live/global-dj/app-release-signed.apk live/downloads/global-dj-v1.0.apk
copy live/deployer/app-release-signed.apk live/downloads/global-deployer-v1.0.apk

# Push downloads — Free — Complete authority
wrangler pages deploy live/downloads --project-name=1989shack-gaih-downloads
wrangler pages deploy live --project-name=1989shack-gaih-global --branch=main
git add .
git commit -m "All 7 Inventions Today — Store AABs + APKs — Package Download — For global users — Complete Authority — YES"
git push origin main

# Done — Package download live — https://1989shack-gaih.lr/downloads/ + https://downloads.1989shack-gaih.lr/
# Now upload AABs to Play Store + MSIX to Microsoft Store — With same rightful codes — Complete authority — Across globe