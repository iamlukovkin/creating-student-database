INSERT INTO student_array
SELECT student.id              as i,
       student.last_name       as last_name,
       student.first_name      as first_name,
       student.patronymic      as patronymic,
       snils                   as snils,
       inn                     as inn,
       certificate_number      as certificate_number,
       student.passport_series as passport_series,
       student.passport_number as passport_number,
       actual_address          as actual_address,
       registration_address    as registration_address,
       temporary_address       as temporary_address,
       array_agg(DISTINCT student_telephone.phone_number) AS phones,
       array_agg(DISTINCT student_email.email) AS emails,
       array_agg(DISTINCT parent_information.id) AS parents,
       math_result             as math_result,
       russian_language_result as russian_language_result,
       profile_subject_result  as profile_subject_result
FROM student
JOIN student_telephone
    ON student.id = student_telephone.student
JOIN student_email
    ON student.id = student_email.student
JOIN student_and_parent sap
    ON student.id = sap.student
JOIN parent_information
    ON sap.parent = parent_information.id
GROUP BY student.id
;
