CREATE DATABASE college;

CREATE SCHEMA acadamics;
CREATE SCHEMA acCOUNTs;
CREATE SCHEMA examinatiONs;
CREATE SCHEMA placements;



CREATE TABLE acadamics.departments(id text PRIMARY KEY,name text NOT NULL,hod text NOT NULL REFERENCES academics.teachers(id) ON UPDATE CASCADE ON DELETE CASCADE);

CREATE TABLE academics.sectiONs(id text PRIMARY KEY,department_id text NOT NULL REFERENCES(academics.departments(id)) ON DELETE 
CASCADE,co_ordinator_teacher_id text NOT NULL REFERENCES academics.teachers(id) ON UPDATE CASCADE ON DELETE CASCADE);

CREATE TYPE qualificatiON AS(degree_no int, degree text, majors text ,school text, FROM_year YEAR , to_year YEAR);

CREATE TABLE academics.teachers(id text PRIMARY KEY,name text NOT NULL,dob date NOT NULL,experience_years int NOT NULL,qualificatiONs qualificatiON[], co_ordinatiON_sectiON text REFERENCES academics.sectiONs(id) ON UPDATE CASCADE ON DELETE CASCADE);

CREATE TABLE academics.subjects(id text PEIMARY KEY, name text NOT NULL, department text REFERENCES academics.sectiONs(id) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE academics.students(id text PRIMARY KEY, name NOT NULL, sectiON_id text REFERENCES academics.sectiONs(id) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE academics.teachers_sectiONs(teacher_id text REFERENCES academics.teachers(id) ON UPDATE CASCADE ON DELETE CASCADE, sectiON_id text REFERENCES academics.sectiONs(id) ON UPDATE CASCADE ON DELETE CASCADE);

CREATE TABLE academics.teachers_subjects(teacher_id text REFERENCES academics.teachers(id) ON UPDATE CASCADE ON DELETE CASCADE, subject_id text REFERENCES academics.subjects(id) ON UPDATE CASCADE ON DELETE CASCADE);




INSERT INTO academics.departments(id,name,sectiONs,hod,teachers)VALUES('CE','Computer Engineering','T1');

INSERT INTO academics.departments(id, name, sectiON, hod, teachers)VALUES('IT', 'InformatiON Technology','T2'),('ECE', 'ElectrONics and CommunicatiONs Engineering', 'T3'),('ME', 'Mechanical Engineering', 'T4'),('ELE', 'Electrical Engineering', 'T4');

INSERT INTO academics.sectiONs(id, department_id, co_ordinator_teacher_id)VALUES('CE-2K19','CE','T10'),('CE-2K18','CE','T11'),('IT-2K19','IT','T11'),('IT-2K18','IT','T12'),('ECE-2K19','ECE','T13'),('ECE-2K18','ECE','T13');

INSERT INTO academics.teachers(id, name, dob, experience_years, qualificatiONs,co_ordinatiON_sectiON)VALUES('T1','Komal Bhatia', '1970-01-01', 10, '{}',''),('T2','Atul MIShra', '1965-01-01', 15, '{}',''),('T3', 'Anil Shri', '1972-01-01', 12, '{}','');

INSERT INTO academics.subjects(id,name,department)VALUES('CE-SUB-01','FOCP','CE-2K19'),('CE-SUB-02', 'ABCD', 'CE-2K18'),('IT-SUB-01', 'ITSOFT', 'IT-2K19');

INSERT INTO academics.students(id,name, sectiON_id)VALUES('000001','Manav Sethi', 'CE-2K18'),('000002','AvinASh', 'CE-2K18');

INSERT INTO academics.teachers_sectiONs(teacher_id, sectiON_id)('T10','CE-2K18'),('T20','CE-2K18');

INSERT INTO academics.teachers_subjects(teacher_id, subject_id)('T10', 'CE-SUB-02');

