CREATE TABLE students (
    id INTEGER PRIMARY KEY,
    name TEXT UNIQUE,
    period INTEGER,
    school_id INTEGER UNIQUE,
    user_id TEXT UNIQUE,
    grade INTEGER,
    gender TEXT,
    student_email TEXT UNIQUE
);

CREATE TABLE course_history (
    id INTEGER PRIMARY KEY,
    student_id INTEGER,
    year INTEGER,
    title TEXT,
    course_id TEXT,
    grade INTEGER,
    mark TEXT,
    FOREIGN KEY (student_id) REFERENCES students(id)
);

CREATE TABLE learning_targets (
    id INTEGER PRIMARY KEY,
    student_id INTEGER,
    unit INTEGER,
    target TEXT,
    date_marked TEXT,
    score INTEGER,
    reassess TEXT,
    FOREIGN KEY (student_id) REFERENCES students(id)
);
