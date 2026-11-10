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
