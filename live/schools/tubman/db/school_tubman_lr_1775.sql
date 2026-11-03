-- GLOBAL ARCHITECTURE INFRASTRUCTURE HOSTING PLATFORM — SCHOOL DATABASE — William Tubman High School — Own Domain: williamtubmanhigh.lr — Subdomain: tubman.1989shack-gaih.lr — On Own cPanel Server With GitHub, Cloudflare And Open Sources — We Have Power — World #1 📯💪💗👍✅ — For Education — For Liberia Africa World — For Mrs. Victoria K. Bangalu Sheriff — With Love — 💜 — Secure Innovative Safeguard — 6 Layers — Hack-Proof — No One Hacks Us — For Government, Defense, Education, Health, Entertainment — For Education — For Future

CREATE DATABASE school_tubman_lr_1775 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE school_tubman_lr_1775;

-- Copy all tables from Life International School template — For William Tubman High School — For Education — For Liberia Africa World — For Future — With Love — 💜
-- Administrators, Teachers, Students, Parents, Live Classes, Assignments, Quizzes, Tests, Fees, Attendance, Announcements, Blockchain Log — For School — For Education — For Liberia Africa World — For Future

-- School Info — For Global Architecture Infrastructure Hosting Platform — For Each School Own Domain + Subdomain — On Own cPanel Server With GitHub, Cloudflare And Open Sources
CREATE TABLE school_info (
  school_id VARCHAR(50) PRIMARY KEY,
  school_name VARCHAR(255) NOT NULL,
  short_code VARCHAR(50) NOT NULL,
  own_domain VARCHAR(255), -- williamtubmanhigh.lr — Own Domain — For School — Connected To Our Platform — Via Cloudflare + cPanel — Free — With Full Authority — For Education
  subdomain_1 VARCHAR(255), -- tubman.1989shack-gaih.lr — For Global Users — Complete Access + Interact — All Platforms — For Education
  subdomain_2 VARCHAR(255), -- tubman.schools.1989shack-gaih.lr — For Schools Network — For Education — For Liberia Africa World
  subdomain_3 VARCHAR(255), -- tubman.edu.1989shack-gaih.lr — For Education — For Liberia Africa World — For Future
  county VARCHAR(100),
  country VARCHAR(10),
  cpanel_path VARCHAR(255),
  github_repo VARCHAR(255), -- For GitHub — Free — Private Repo — For School — For Education — For Liberia Africa World
  cloudflare_zone VARCHAR(255), -- For Cloudflare — Free — DNS + CDN + SSL + DDoS + Pages + Workers — For School Domain + Subdomain — Global Edge — For  Data — Low Data
  open_sources TEXT, -- Moodle, Jitsi, BigBlueButton, WordPress, MySQL, Node.js, PHP, Python — For School — For Education — For Free
  blockchain_hash VARCHAR(255), -- Blockchain — Layer 6 — For Transaction — Hack-Proof — No One Hacks Us
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO school_info (school_id, school_name, short_code, own_domain, subdomain_1, subdomain_2, subdomain_3, county, country, cpanel_path, github_repo, cloudflare_zone, blockchain_hash)
VALUES (
  'SCHOOL-TUBMAN-001-LR-1775',
  'William Tubman High School',
  'tubman',
  'williamtubmanhigh.lr',
  'tubman.1989shack-gaih.lr',
  'tubman.schools.1989shack-gaih.lr',
  'tubman.edu.1989shack-gaih.lr',
  'Montserrado',
  'LR',
  'live/schools/tubman',
  'github.com/1989SHACK-GAIH/school-schoolSlug',
  'cloudflare.com/zones/schoolSlug-1989shack-gaih-lr',
  'BLOCK-SCHOOL-TUBMAN-001-LR-1775'
);
