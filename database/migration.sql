-- Create Students Table
CREATE TABLE IF NOT EXISTS students (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT UNIQUE,
    phone TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Lessons Table
CREATE TABLE IF NOT EXISTS lessons (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    code TEXT UNIQUE,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Exams Table
CREATE TABLE IF NOT EXISTS exams (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    exam_type TEXT,
    total_questions INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Exam-Lessons Mapping Table
CREATE TABLE IF NOT EXISTS exam_lessons (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    exam_id INTEGER NOT NULL,
    lesson_id INTEGER NOT NULL,
    question_count INTEGER DEFAULT 0,
    FOREIGN KEY (exam_id) REFERENCES exams(id),
    FOREIGN KEY (lesson_id) REFERENCES lessons(id),
    UNIQUE(exam_id, lesson_id)
);

-- Create Answer Keys Table
CREATE TABLE IF NOT EXISTS answer_keys (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    exam_id INTEGER NOT NULL,
    question_number INTEGER NOT NULL,
    answer TEXT NOT NULL,
    FOREIGN KEY (exam_id) REFERENCES exams(id),
    UNIQUE(exam_id, question_number)
);

-- Create Results Table
CREATE TABLE IF NOT EXISTS results (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id INTEGER NOT NULL,
    exam_id INTEGER NOT NULL,
    question_number INTEGER NOT NULL,
    student_answer TEXT,
    is_correct BOOLEAN,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (exam_id) REFERENCES exams(id)
);

-- Create Scores Table
CREATE TABLE IF NOT EXISTS scores (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id INTEGER NOT NULL,
    exam_id INTEGER NOT NULL,
    total_correct INTEGER DEFAULT 0,
    total_wrong INTEGER DEFAULT 0,
    total_blank INTEGER DEFAULT 0,
    percentage REAL DEFAULT 0.0,
    rank INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (exam_id) REFERENCES exams(id),
    UNIQUE(student_id, exam_id)
);

-- Create Templates Table
CREATE TABLE IF NOT EXISTS templates (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    template_type TEXT,
    file_path TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Indexes for better performance
CREATE INDEX IF NOT EXISTS idx_students_email ON students(email);
CREATE INDEX IF NOT EXISTS idx_results_student_exam ON results(student_id, exam_id);
CREATE INDEX IF NOT EXISTS idx_scores_exam ON scores(exam_id);
CREATE INDEX IF NOT EXISTS idx_exam_lessons_exam ON exam_lessons(exam_id);