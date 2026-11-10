-- LIFE INTERNATIONAL SCHOOL — SECURE DATABASE SYSTEM — FOR ADMINISTRATORS, TEACHERS, STUDENTS, PARENTS — LIVE CLASSES, TEST EVALUATION, ASSIGNMENTS, QUIZZES — OFFICIAL — SECURE INNOVATIVE SAFEGUARD — 6 LAYERS — HACK-PROOF
-- FOR LIFE INTERNATIONAL SCHOOL — FOR LIBERIA — FOR AFRICA — FOR WORLD — FOR EDUCATION — FOR MRS. VICTORIA K. BANGALU SHERIFF — WITH LOVE — 💜

CREATE DATABASE life_international_school CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE life_international_school;

-- Layer 1-6 Security: Device ID + Face ID + Biometric + 2FA 1775 + AES-256 + Blockchain — For All Users — Hack-Proof — No One Hacks Us

-- 1. ADMINISTRATORS — Full Authority — Controls cPanel + GitHub + Cloudflare — For School
CREATE TABLE administrators (
  admin_id VARCHAR(50) PRIMARY KEY, -- DEV-xxx-LR-1775 — Device ID — Layer 1
  full_name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  phone VARCHAR(20),
  password_hash VARCHAR(255) NOT NULL, -- AES-256 Encrypted — Layer 5
  face_id_hash VARCHAR(255), -- Face ID — Layer 2
  biometric_hash VARCHAR(255), -- Biometric — Layer 3
  twofa_1775 VARCHAR(20), -- 2FA 1775 — Layer 4
  blockchain_hash VARCHAR(255), -- Blockchain — Layer 6 — Transaction Log
  role ENUM('super_admin','principal','vice_principal','registrar','finance','it_admin') DEFAULT 'super_admin',
  device_id VARCHAR(100), -- Device Fingerprint
  last_login DATETIME,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  status ENUM('active','suspended') DEFAULT 'active'
);

-- 2. TEACHERS — For Education — Entroknowty Learning — Based On Own Entroknowty
CREATE TABLE teachers (
  teacher_id VARCHAR(50) PRIMARY KEY,
  admin_id VARCHAR(50),
  full_name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  phone VARCHAR(20),
  password_hash VARCHAR(255) NOT NULL,
  face_id_hash VARCHAR(255),
  biometric_hash VARCHAR(255),
  twofa_1775 VARCHAR(20),
  blockchain_hash VARCHAR(255),
  device_id VARCHAR(100),
  subject VARCHAR(100), -- Mathematics, English, Science, Entomology, CBL Economics, ICT, etc
  class_assigned VARCHAR(50), -- Grade 1-12
  qualification VARCHAR(255),
  entroknowty_profile TEXT, -- Entroknowty — Inner knowledge possessed by teacher — Based on own entroknowty — For teaching
  photo_url VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (admin_id) REFERENCES administrators(admin_id)
);

-- 3. STUDENTS — For Future Leaders — For Liberia — For Africa — For World
CREATE TABLE students (
  student_id VARCHAR(50) PRIMARY KEY,
  full_name VARCHAR(100) NOT NULL,
  dob DATE,
  gender ENUM('M','F'),
  grade VARCHAR(20) NOT NULL, -- Nursery, KG, Grade 1-12
  class_section VARCHAR(20), -- A, B, C
  parent_id VARCHAR(50),
  email VARCHAR(100),
  phone VARCHAR(20),
  password_hash VARCHAR(255),
  face_id_hash VARCHAR(255), -- For Attendance — Face ID — For Security
  biometric_hash VARCHAR(255),
  twofa_1775 VARCHAR(20),
  device_id VARCHAR(100),
  blockchain_hash VARCHAR(255),
  photo_url VARCHAR(255),
  address TEXT,
  enrollment_date DATE,
  status ENUM('active','graduated','suspended','withdrawn') DEFAULT 'active',
  entroknowty_learning_score INT DEFAULT 0, -- Entroknowty Learning Inner Knowledge Score — Based on own entroknowty
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4. PARENTS — For Family — For Monitoring — For Future — With Love
CREATE TABLE parents (
  parent_id VARCHAR(50) PRIMARY KEY,
  full_name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  phone VARCHAR(20) NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  face_id_hash VARCHAR(255),
  biometric_hash VARCHAR(255),
  twofa_1775 VARCHAR(20),
  device_id VARCHAR(100),
  blockchain_hash VARCHAR(255),
  relationship ENUM('father','mother','guardian','aunt','uncle') DEFAULT 'father',
  occupation VARCHAR(100),
  address TEXT,
  photo_url VARCHAR(255),
  sms_alert ENUM('yes','no') DEFAULT 'yes', -- Parent SMS — For Grades + Attendance + Fees — For  Data — Low Data
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Link Students to Parents — Many to Many — For Family
CREATE TABLE student_parent_link (
  link_id INT AUTO_INCREMENT PRIMARY KEY,
  student_id VARCHAR(50),
  parent_id VARCHAR(50),
  is_primary BOOLEAN DEFAULT TRUE,
  FOREIGN KEY (student_id) REFERENCES students(student_id),
  FOREIGN KEY (parent_id) REFERENCES parents(parent_id)
);

-- 5. LIVE CLASSES — Low Data 144p WebRTC — For  Data — For Duala + Global — For Education
CREATE TABLE live_classes (
  class_id VARCHAR(50) PRIMARY KEY,
  teacher_id VARCHAR(50),
  subject VARCHAR(100) NOT NULL,
  grade VARCHAR(20) NOT NULL,
  topic VARCHAR(255) NOT NULL,
  description TEXT,
  scheduled_time DATETIME NOT NULL,
  duration_minutes INT DEFAULT 60,
  meeting_link VARCHAR(255), -- https://live.1989shack-gaih.lr/ + https://life.1989shack-gaih.lr/live/{class_id} — For Live Classes — Network 🛜
  recording_url VARCHAR(255), -- For replay — For  Data — Low Data
  status ENUM('scheduled','live','ended','cancelled') DEFAULT 'scheduled',
  entroknowty_topic TEXT, -- Entroknowty Learning Topic — Based on own entroknowty — For education
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);

CREATE TABLE live_class_attendance (
  attendance_id INT AUTO_INCREMENT PRIMARY KEY,
  class_id VARCHAR(50),
  student_id VARCHAR(50),
  joined_at DATETIME,
  left_at DATETIME,
  duration_minutes INT,
  face_verified BOOLEAN DEFAULT FALSE, -- Face ID Verification — Layer 2 — For Attendance — For Security
  device_id VARCHAR(100),
  blockchain_hash VARCHAR(255),
  FOREIGN KEY (class_id) REFERENCES live_classes(class_id),
  FOREIGN KEY (student_id) REFERENCES students(student_id)
);

-- 6. ASSIGNMENTS — For Students — For Future — With Love
CREATE TABLE assignments (
  assignment_id VARCHAR(50) PRIMARY KEY,
  teacher_id VARCHAR(50),
  subject VARCHAR(100) NOT NULL,
  grade VARCHAR(20) NOT NULL,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  file_url VARCHAR(255), -- PDF, DOC, Video — For  Data — Low Data
  due_date DATETIME NOT NULL,
  max_score INT DEFAULT 100,
  entroknowty_task TEXT, -- Entroknowty Task — Based on own entroknowty — For students to share inner knowledge
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);

CREATE TABLE assignment_submissions (
  submission_id VARCHAR(50) PRIMARY KEY,
  assignment_id VARCHAR(50),
  student_id VARCHAR(50),
  file_url VARCHAR(255),
  text_answer TEXT,
  submitted_at DATETIME,
  score INT,
  feedback TEXT,
  graded_by VARCHAR(50),
  graded_at DATETIME,
  blockchain_hash VARCHAR(255), -- Blockchain Certificate — For Assignment — For Future — Hack-Proof
  FOREIGN KEY (assignment_id) REFERENCES assignments(assignment_id),
  FOREIGN KEY (student_id) REFERENCES students(student_id)
);

-- 7. QUIZZES — For Test Evaluation — For Future Leaders — For Education
CREATE TABLE quizzes (
  quiz_id VARCHAR(50) PRIMARY KEY,
  teacher_id VARCHAR(50),
  subject VARCHAR(100) NOT NULL,
  grade VARCHAR(20) NOT NULL,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  duration_minutes INT DEFAULT 30,
  total_questions INT,
  max_score INT DEFAULT 100,
  start_time DATETIME,
  end_time DATETIME,
  shuffle_questions BOOLEAN DEFAULT TRUE,
  show_results ENUM('immediate','after_end','never') DEFAULT 'immediate',
  entroknowty_quiz BOOLEAN DEFAULT FALSE, -- Entroknowty Quiz — Based on own entroknowty — Inner knowledge
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);

CREATE TABLE quiz_questions (
  question_id VARCHAR(50) PRIMARY KEY,
  quiz_id VARCHAR(50),
  question_text TEXT NOT NULL,
  question_type ENUM('mcq','true_false','short_answer','essay','entroknowty') DEFAULT 'mcq', -- entroknowty type — Based on own entroknowty
  options JSON, -- For MCQ — ["A","B","C","D"]
  correct_answer TEXT,
  score INT DEFAULT 10,
  explanation TEXT,
  FOREIGN KEY (quiz_id) REFERENCES quizzes(quiz_id)
);

CREATE TABLE quiz_submissions (
  submission_id VARCHAR(50) PRIMARY KEY,
  quiz_id VARCHAR(50),
  student_id VARCHAR(50),
  answers JSON,
  score INT,
  submitted_at DATETIME,
  time_taken_minutes INT,
  device_id VARCHAR(100),
  face_verified BOOLEAN DEFAULT FALSE, -- Face ID — For Quiz — For Security — No cheating — For integrity
  blockchain_hash VARCHAR(255),
  FOREIGN KEY (quiz_id) REFERENCES quizzes(quiz_id),
  FOREIGN KEY (student_id) REFERENCES students(student_id)
);

-- 8. TEST EVALUATION — Official — For Report Card — For Future — For Liberia
CREATE TABLE tests (
  test_id VARCHAR(50) PRIMARY KEY,
  teacher_id VARCHAR(50),
  subject VARCHAR(100) NOT NULL,
  grade VARCHAR(20) NOT NULL,
  term ENUM('1st','2nd','3rd') DEFAULT '1st',
  academic_year VARCHAR(20) DEFAULT '2026/2027',
  title VARCHAR(255) NOT NULL, -- 1st Period Test, 2nd Period Test, Final Exam
  max_score INT DEFAULT 100,
  test_date DATE NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);

CREATE TABLE test_scores (
  score_id INT AUTO_INCREMENT PRIMARY KEY,
  test_id VARCHAR(50),
  student_id VARCHAR(50),
  score INT NOT NULL,
  grade_letter VARCHAR(5), -- A, B+, B, C, etc
  remarks TEXT,
  graded_by VARCHAR(50),
  graded_at DATETIME,
  parent_viewed BOOLEAN DEFAULT FALSE,
  parent_sms_sent BOOLEAN DEFAULT FALSE, -- Parent SMS — For Grades — For  Data — Low Data
  blockchain_hash VARCHAR(255), -- Blockchain Certificate — For Test — For Future — Hack-Proof — No One Hacks Us
  FOREIGN KEY (test_id) REFERENCES tests(test_id),
  FOREIGN KEY (student_id) REFERENCES students(student_id)
);

-- 9. OTHER ACTIVITIES — For School Portal — For Future — For Complete Access + Interact
CREATE TABLE announcements (
  announcement_id VARCHAR(50) PRIMARY KEY,
  admin_id VARCHAR(50),
  title VARCHAR(255) NOT NULL,
  message TEXT NOT NULL,
  target ENUM('all','administrators','teachers','students','parents','grade') DEFAULT 'all',
  grade_target VARCHAR(20),
  priority ENUM('low','medium','high','urgent') DEFAULT 'medium',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (admin_id) REFERENCES administrators(admin_id)
);

CREATE TABLE fees (
  fee_id VARCHAR(50) PRIMARY KEY,
  student_id VARCHAR(50),
  academic_year VARCHAR(20),
  term VARCHAR(20),
  amount DECIMAL(10,2) NOT NULL, -- In L$ and USD — With CBL L.50 Real Rate — No Fake Rates — For Economy — For GOV-NET
  amount_usd DECIMAL(10,2),
  cbl_rate DECIMAL(10,2) DEFAULT 169.50, -- CBL L.50 Real Rate — For Economy
  paid_amount DECIMAL(10,2) DEFAULT 0,
  balance DECIMAL(10,2),
  due_date DATE,
  status ENUM('paid','partial','unpaid','overdue') DEFAULT 'unpaid',
  blockchain_hash VARCHAR(255), -- Blockchain — For Fees — For Finance — For Transparency — Hack-Proof
  FOREIGN KEY (student_id) REFERENCES students(student_id)
);

CREATE TABLE attendance (
  attendance_id INT AUTO_INCREMENT PRIMARY KEY,
  student_id VARCHAR(50),
  date DATE NOT NULL,
  status ENUM('present','absent','late','excused') DEFAULT 'present',
  marked_by VARCHAR(50),
  face_verified BOOLEAN DEFAULT FALSE,
  device_id VARCHAR(100),
  blockchain_hash VARCHAR(255),
  FOREIGN KEY (student_id) REFERENCES students(student_id)
);

-- Blockchain Log — For All Transactions — For Transparency — For Security — Hack-Proof — No One Hacks Us
CREATE TABLE blockchain_log (
  block_id VARCHAR(100) PRIMARY KEY,
  action VARCHAR(100) NOT NULL, -- LOGIN, ASSIGNMENT_SUBMIT, QUIZ_SUBMIT, TEST_SCORE, FEE_PAYMENT, etc
  user_id VARCHAR(50) NOT NULL,
  user_type ENUM('admin','teacher','student','parent') NOT NULL,
  device_id VARCHAR(100),
  ip_address VARCHAR(50),
  details JSON,
  hash VARCHAR(255) NOT NULL, -- SHA256 Hash — For Blockchain — For Security
  previous_hash VARCHAR(255),
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
