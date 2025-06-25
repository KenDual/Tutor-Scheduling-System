create database tutor_project;
go
use tutor_project;
go

drop table users;
drop table tutors;
drop table students;
drop table sessions;
drop table student_bookings;
drop table study_materials;
drop table exercises;
drop table exercise_submissions;
drop table subjects;
drop table timetable;


create table users(
user_id int identity(1,1) primary key,
email varchar(100) unique not null,
password varchar(255) not null,
role varchar(20) not null CHECK (role IN ('student','tutor','admin')),
full_name Nvarchar(100),
phone varchar(20),
create_at DATETIME default getdate()
);

create table tutors(
tutor_id int primary key,
education nvarchar(max),
profile nvarchar(max),
fee_default decimal(10,2),
CONSTRAINT fk_tutor_user FOREIGN KEY (tutor_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE TABLE students (
student_id  INT PRIMARY KEY,
grade_level NVARCHAR(50),
learning_goal NVARCHAR(MAX),
CONSTRAINT fk_student_user FOREIGN KEY (student_id) REFERENCES users(user_id) ON DELETE CASCADE
);

create table subjects(
subject_id int identity(1,1) primary key,
name nvarchar(100),
description nvarchar(255),
create_at datetime default getdate()
);

CREATE TABLE sessions (
  session_id   INT IDENTITY(1,1) PRIMARY KEY,
  session_code VARCHAR(16) NOT NULL UNIQUE,
  tutor_id     INT NOT NULL,
  subject_id   INT NOT NULL,
  location     NVARCHAR(255),
  capacity     INT NOT NULL CHECK (capacity > 0 and capacity < 11),
  status       VARCHAR(20) NOT NULL DEFAULT 'scheduled' CHECK (status IN ('scheduled', 'cancelled', 'completed')),
  created_at   DATETIME DEFAULT GETDATE(),
  CONSTRAINT fk_session_tutor FOREIGN KEY (tutor_id) REFERENCES tutors(tutor_id),
  CONSTRAINT fk_session_subject FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);

CREATE TABLE student_bookings (
  booking_id   INT IDENTITY(1,1) PRIMARY KEY,
  session_id   INT NOT NULL,
  student_id   INT NOT NULL,
  booking_time DATETIME DEFAULT GETDATE(),
  status       VARCHAR(20) NOT NULL CHECK (status IN ('booked', 'cancelled')),
  CONSTRAINT fk_booking_session FOREIGN KEY (session_id) REFERENCES sessions(session_id),
  CONSTRAINT fk_booking_student FOREIGN KEY (student_id) REFERENCES students(student_id)
);

create table timetable(
timetable_id int identity(1,1) primary key,
session_id INT NOT NULL,
day_of_week VARCHAR(10) NOT NULL CHECK (day_of_week IN ('mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun')),
slot INT NOT NULL CHECK (slot IN (1, 2, 3)),
location NVARCHAR(255),
status VARCHAR(20) NOT NULL DEFAULT 'scheduled' CHECK (status IN ('scheduled', 'cancelled', 'completed')),
created_at DATETIME DEFAULT GETDATE(),
CONSTRAINT fk_timetable_session FOREIGN KEY (session_id) REFERENCES sessions(session_id) ON DELETE CASCADE
);

CREATE TABLE study_materials (
  material_id  INT IDENTITY(1,1) PRIMARY KEY,
  title        NVARCHAR(255) NOT NULL,
  description  NVARCHAR(500),
  file_url     NVARCHAR(500),
  uploaded_at  DATETIME DEFAULT GETDATE()
);

CREATE TABLE exercises (
  exercise_id  INT IDENTITY(1,1) PRIMARY KEY,
  session_id   INT NOT NULL,
  title        NVARCHAR(255) NOT NULL,
  description  NVARCHAR(500),
  due_date     DATETIME,
  CONSTRAINT fk_exercise_session FOREIGN KEY (session_id) REFERENCES sessions(session_id)
);

CREATE TABLE exercise_submissions (
  submission_id INT IDENTITY(1,1) PRIMARY KEY,
  exercise_id   INT NOT NULL,
  student_id    INT NOT NULL,
  submission_time DATETIME DEFAULT GETDATE(),
  file_url      NVARCHAR(500),
  grade         DECIMAL(5,2),
  feedback      NVARCHAR(500),
  CONSTRAINT fk_submission_exercise FOREIGN KEY (exercise_id) REFERENCES exercises(exercise_id),
  CONSTRAINT fk_submission_student FOREIGN KEY (student_id) REFERENCES students(student_id)
);


-- Bảng users
INSERT INTO users (email, password, role, full_name, phone)
VALUES 
    ('john@example.com', 'hash1', 'tutor', 'John Doe', '1234567890'),
    ('jane@example.com', 'hash2', 'student', 'Jane Smith', '2345678901'),
    ('admin@example.com', 'hash3', 'admin', 'Admin', '3456789012'),
    ('alice@example.com', 'hash4', 'tutor', 'Alice Jones', '4567890123'),
    ('bob@example.com', 'hash5', 'student', 'Bob Brown', '5678901234');

-- Bảng tutors
INSERT INTO tutors (tutor_id, education, profile, fee_default)
VALUES 
    (1, 'MSc Math', 'Math tutor', 50.00),
    (2, 'BSc Physics', 'Physics tutor', 45.00),
    (3, 'PhD Chemistry', 'Chem tutor', 60.00),
    (4, 'MEd Education', 'Educator', 55.00),
    (5, 'BA English', 'English tutor', 40.00);

-- Bảng students
INSERT INTO students (student_id, grade_level, learning_goal)
VALUES 
    (1, 'Grade 10', 'Improve math'),
    (2, 'Grade 12', 'Pass physics'),
    (3, 'Grade 11', 'Learn chemistry'),
    (4, 'Grade 9', 'Better writing'),
    (5, 'Grade 8', 'Solve problems');

-- Bảng subjects
INSERT INTO subjects (name, description)
VALUES 
    ('Math', 'Algebra and calculus'),
    ('Physics', 'Mechanics'),
    ('Chemistry', 'Organic chem'),
    ('English', 'Writing skills'),
    ('Biology', 'Cell biology');

-- Bảng sessions
INSERT INTO sessions (session_code, tutor_id, subject_id, location, capacity, status)
VALUES 
    ('S001', 1, 1, 'Room A1', 5, 'scheduled'),
    ('S002', 2, 2, 'Room B2', 8, 'scheduled'),
    ('S003', 3, 3, 'Online', 6, 'scheduled'),
    ('S004', 4, 4, 'Room C3', 7, 'scheduled'),
    ('S005', 5, 5, 'Room D4', 4, 'scheduled');

-- Bảng student_bookings
INSERT INTO student_bookings (session_id, student_id, status)
VALUES 
    (1, 2, 'booked'),
    (2, 5, 'booked'),
    (3, 2, 'booked'),
    (4, 5, 'booked'),
    (5, 2, 'booked');

-- Bảng timetable
INSERT INTO timetable (session_id, day_of_week, slot, location, status)
VALUES 
    (1, 'mon', 1, 'Room A1', 'scheduled'),
    (2, 'tue', 2, 'Room B2', 'scheduled'),
    (3, 'wed', 3, 'Online', 'scheduled'),
    (4, 'thu', 1, 'Room C3', 'scheduled'),
    (5, 'fri', 2, 'Room D4', 'scheduled');

-- Bảng study_materials
INSERT INTO study_materials (title, description, file_url)
VALUES 
    ('Algebra Notes', 'Basic algebra', '/files/algebra.pdf'),
    ('Physics Guide', 'Mechanics intro', '/files/physics.pdf'),
    ('Chem Notes', 'Organic compounds', '/files/chem.pdf'),
    ('Writing Tips', 'Essay writing', '/files/english.pdf'),
    ('Bio Intro', 'Cell structure', '/files/bio.pdf');

-- Bảng exercises
INSERT INTO exercises (session_id, title, description, due_date)
VALUES 
    (1, 'Math Quiz', '10 questions', '2025-06-30'),
    (2, 'Physics Task', '5 problems', '2025-07-01'),
    (3, 'Chem Test', 'Organic quiz', '2025-07-02'),
    (4, 'Essay', 'Write 500 words', '2025-07-03'),
    (5, 'Bio Work', 'Cell questions', '2025-07-04');

-- Bảng exercise_submissions
INSERT INTO exercise_submissions (exercise_id, student_id, file_url, grade, feedback)
VALUES 
    (1, 2, '/sub/math.pdf', 85.00, 'Good job'),
    (2, 5, '/sub/phys.pdf', 90.00, 'Excellent'),
    (3, 2, '/sub/chem.pdf', 75.00, 'More detail'),
    (4, 5, '/sub/essay.pdf', 88.00, 'Well done'),
    (5, 2, '/sub/bio.pdf', 82.00, 'Nice effort');


select * from users;
select * from tutors;
select * from students;
select * from sessions;
select * from student_bookings;
select * from subjects;
select * from study_materials;
select * from exercises;
select * from exercise_submissions;
select * from timetable;

