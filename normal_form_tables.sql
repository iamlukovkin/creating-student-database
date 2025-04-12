CREATE DATABASE study_normal_form;
DROP DATABASE study_normal_form;

CREATE TABLE student
(
    id SERIAL PRIMARY KEY,
    last_name VARCHAR(30),
    first_name VARCHAR(30),
    patronymic VARCHAR(30),
    snils VARCHAR(13) UNIQUE,
    inn VARCHAR(12) UNIQUE,
    certificate_number VARCHAR(14) UNIQUE,
    passport_series VARCHAR(4),
    passport_number VARCHAR(6),
    actual_address VARCHAR(100),
    registration_address VARCHAR(100) NOT NULL,
    temporary_address VARCHAR(100),
    math_result int CHECK (math_result BETWEEN 0 AND 100),
    russian_language_result int CHECK (russian_language_result BETWEEN 0 AND 100),
    profile_subject_result int CHECK (profile_subject_result BETWEEN 0 AND 100),
    UNIQUE (passport_series, passport_number)
);
CREATE TABLE student_telephone
(
    student int,
    row_number int,
    phone_number VARCHAR(30),
    PRIMARY KEY(student, row_number),
    FOREIGN KEY(student) REFERENCES student(id)
);
CREATE TABLE student_email
(
    student    int,
    row_number int,
    email      VARCHAR(100),
    PRIMARY KEY(student, row_number),
    FOREIGN KEY(student) REFERENCES student(id)
);
CREATE TABLE parent_information
(
    id SERIAL PRIMARY KEY,
    passport_series VARCHAR(4),
    passport_number VARCHAR(6),
    last_name VARCHAR(30),
    first_name VARCHAR(30),
    patronymic VARCHAR(30),
    phone_number VARCHAR(30)
);
CREATE TABLE student_and_parent
(
    student int,
    parent int,
    who_is varchar(6),
    PRIMARY KEY (student, parent),
    FOREIGN KEY (student) REFERENCES student(id),
    FOREIGN KEY (parent) REFERENCES parent_information(id)
);
CREATE TABLE study
(
    student int,
    group_number VARCHAR(5),
    is_full_time BOOL,
    is_by_agreement BOOL,
    is_commercial BOOL,
    PRIMARY KEY (student, group_number),
    FOREIGN KEY (student) REFERENCES student(id)
);

