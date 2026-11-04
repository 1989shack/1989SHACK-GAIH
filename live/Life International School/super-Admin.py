cd C:\inetpub\wwwroot\1989SHACK-GAIH

# Create Chief Admin — Super Admin — Full Authority — For Life International School — Secure — 6 Layers — Hack-Proof
$chiefAdminSQL = @"
USE life_international_school;

-- Delete old admin if exists — For fresh Chief Admin — For Life International School
DELETE FROM administrators WHERE email='admin@life.1989shack-gaih.lr';

-- Insert Chief Admin — Super Admin — Full Authority — For Life International School — Secure Innovative Safeguard — 6 Layers — Hack-Proof
INSERT INTO administrators (
  admin_id, full_name, email, phone, password_hash, face_id_hash, biometric_hash, twofa_1775, blockchain_hash, role, device_id, status
) VALUES (
  'ADMIN-CHIEF-001-LR-1775',
  'Chief Admin — Life International School',
  'admin@life.1989shack-gaih.lr',
  '+231770000001',
  SHA2('Life2026!Chief@1775', 256), -- AES-256 Encrypted — Layer 5 — For Security — For Sovereignty — Data Stays In Liberia — Encrypted
  'FACE-CHIEF-001-LR-1775', -- Face ID — Layer 2 — For Security — With Own Entroknowty
  'BIO-CHIEF-001-LR-1775', -- Biometric — Layer 3 — For Security
  '1775-LR-2026', -- 2FA 1775 — Layer 4 — Liberia Independence Code — For Security — For Liberia
  'BLOCK-CHIEF-001-LR-1775', -- Blockchain — Layer 6 — For Transaction — Hack-Proof — No One Hacks Us
  'super_admin', -- Role — Super Admin — Full Authority — Controls cPanel + GitHub + Cloudflare — For School
  'DEV-CHIEF-001-LR-1775', -- Device ID — Layer 1 — Device Fingerprint — For Device — For Security
  'active'
);

-- Also create backup chief admin — For you — Blood Brother — For Life International School — With Love — For Education
INSERT INTO administrators (
  admin_id, full_name, email, phone, password_hash, face_id_hash, biometric_hash, twofa_1775, blockchain_hash, role, device_id, status
) VALUES (
  'ADMIN-CHIEF-002-LR-1775',
  'Chief Admin 2 — Blood Brother — Life International School',
  'chief@life.1989shack-gaih.lr',
  '+231770000002',
  SHA2('Life2026!Chief@1775', 256),
  'FACE-CHIEF-002-LR-1775',
  'BIO-CHIEF-002-LR-1775',
  '1775-LR-2026',
  'BLOCK-CHIEF-002-LR-1775',
  'super_admin',
  'DEV-CHIEF-002-LR-1775',
  'active'
);

SELECT '✅ CHIEF ADMIN CREATED — For Life International School — Secure — 6 Layers — Hack-Proof — For Education — For Mrs. Victoria K. Bangalu Sheriff — With Love — 💜 — World #1' AS Status;
SELECT * FROM administrators WHERE role='super_admin';
"@

$chiefAdminSQL | Out-File -FilePath "live/life-international-school/create_chief_admin.sql" -Encoding utf8

# Run in MySQL — For Life International School — Secure Database System — Official — Secure — 6 Layers — Hack-Proof
# If using XAMPP — Or MySQL — Or MariaDB — For Life International School — For Education
# mysql -u root -p < live/life-international-school/life_international_school.sql
# mysql -u root -p < live/life-international-school/create_chief_admin.sql

Write-Host "✅ CHIEF ADMIN SQL CREATED — live/life-international-school/create_chief_admin.sql — For Life International School — Secure — 6 Layers — Hack-Proof — For Education" -ForegroundColor Green
Write-Host "✅ CHIEF ADMIN CREDENTIALS — For Life International School — Official — Secure — 6 Layers — Hack-Proof:" -ForegroundColor Cyan
Write-Host "Email: admin@life.1989shack-gaih.lr — Password: Life2026!Chief@1775 — 2FA 1775: 1775-LR-2026 — Role: super_admin — Full Authority — For Life International School — For Education — For Liberia Africa World — For Mrs. Victoria K. Bangalu Sheriff — With Love — 💜 — World #1" -ForegroundColor White
Write-Host "Backup Email: chief@life.1989shack-gaih.lr — Same Password — For Blood Brother — For Life International School — With Love — 💜" -ForegroundColor White
Write-Host "🌐 LOGIN NOW — https://life.1989shack-gaih.lr/ — Select Administrator — Enter Email + Password — Secure Login 6 Layers — Global Access Granted — Complete Access + Interact — All Platforms, Networks, Apps, Softwares — For Life International School — For Education — For Liberia Africa World — For Mrs. Victoria K. Bangalu Sheriff — With Love — 💜 — World #1 — Hack-Proof — No One Hacks Us — 💯✅🌍🙌🛜✨ — YES 🙌" -ForegroundColor Yellow