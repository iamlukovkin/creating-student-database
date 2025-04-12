CREATE TABLE student_json
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
    phones jsonb,
    emails jsonb,
    parents jsonb,
    math_result int CHECK (math_result BETWEEN 0 AND 100),
    russian_language_result int CHECK (russian_language_result BETWEEN 0 AND 100),
    profile_subject_result int CHECK (profile_subject_result BETWEEN 0 AND 100),
    UNIQUE (passport_series, passport_number)
);
