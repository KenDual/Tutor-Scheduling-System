create database tutor_project;
go
use tutor_project;
go

drop database tutor_project;

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
      day_of_week VARCHAR(10) NOT NULL CHECK (day_of_week IN ('mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun')),
      slot INT NOT NULL CHECK (slot IN (1, 2, 3)),
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



INSERT INTO users (email, password, role, full_name, phone)
VALUES 
    ('tutor@gmail.com',  '1', 'tutor',  'John Doe',  '1234567890'),
    ('student@gmail.com',  '1', 'student','Jane Smith','2345678901'),
    ('admin@gmail.com', '1', 'admin',  'Admin',     '3456789012'),
    ('alice@gmail.com', '1', 'tutor',  'Alice Jones','4567890123'),
    ('bob@gmail.com',   '1', 'student','Bob Brown', '5678901234');
INSERT INTO tutors (tutor_id, education, profile, fee_default)
VALUES
    (1, 'MSc Mathematics',   'Experienced math tutor', 50.00),
    (4, 'MEd Education',     'Language & writing coach', 55.00);
INSERT INTO students (student_id, grade_level, learning_goal)
VALUES
    (2, 'Grade 12', 'Pass Physics final'),
    (5, 'Grade 8',  'Improve problem-solving skills');
INSERT INTO subjects (name, description)
VALUES 
    ('Math',     'Algebra and calculus'),
    ('Physics',  'Mechanics'),
    ('Chemistry','Organic chemistry'),
    ('English',  'Writing skills'),
    ('Biology',  'Cell biology');
INSERT INTO sessions
    (session_code, tutor_id, subject_id, day_of_week, slot,
     location, capacity, status)
VALUES
    ('S001', 1, 1, 'mon', 1, 'Room A1', 5, 'scheduled'),
    ('S002', 1, 2, 'wed', 2, 'Room B2', 8, 'scheduled'),
    ('S003', 4, 4, 'fri', 1, 'Room C3', 7, 'scheduled'),
    ('S004', 4, 5, 'sat', 2, 'Online',   4, 'scheduled');
INSERT INTO student_bookings (session_id, student_id, status)
VALUES
    (1, 2, 'booked'),
    (2, 5, 'booked'),
    (3, 2, 'booked'),
    (4, 5, 'booked');
INSERT INTO study_materials (title, description, file_url)
VALUES 
    ('Math Basic', 'Basic math with simple calculations', '/files/math.pdf'),
    ('Physics Guide', 'Mechanics introduction', '/files/physics.pdf'),
    ('Chemistry Notes',    'Organic compounds', '/files/chem.pdf'),
    ('Writing Tips',  'Essay writing skills', '/files/english.pdf'),
    ('Bio Intro',     'Cell structure', '/files/bio.pdf');
INSERT INTO exercises (session_id, title, description, due_date)
VALUES
    (1, 'Math Quiz',     '10 algebra questions',     '2025-06-30'),
    (2, 'Physics Task',  '5 mechanics problems',     '2025-07-01'),
    (3, 'Essay',         'Write a 500-word essay',   '2025-07-03'),
    (4, 'Bio Worksheet', 'Cell-biology questions',   '2025-07-04'),
    (4, 'Sci Worksheet', 'Cell-biology questions',   '2025-08-04'),
    (4, 'Math Worksheet', 'Cell-biology questions',   '2025-07-04'),
    (4, 'Che Worksheet', 'Cell-biology questions',   '2025-07-04');

select * from users;
select * from tutors;
select * from students;
select * from sessions;
select * from student_bookings;
select * from subjects;
select * from study_materials;
select * from exercises;







TRUNCATE TABLE users;
TRUNCATE TABLE tutors;
TRUNCATE TABLE students;
TRUNCATE TABLE sessions;
TRUNCATE TABLE student_bookings;
TRUNCATE TABLE subjects;
TRUNCATE TABLE study_materials;
TRUNCATE TABLE exercises;



