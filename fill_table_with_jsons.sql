INSERT INTO student_json(id, last_name, first_name, patronymic, snils, inn, certificate_number, passport_series,
                         passport_number, actual_address, registration_address, temporary_address,
                         math_result, russian_language_result, profile_subject_result)
SELECT id,
       last_name,
       first_name,
       patronymic,
       snils,
       inn,
       certificate_number,
       passport_series,
       passport_number,
       actual_address,
       registration_address,
       temporary_address,
       math_result,
       russian_language_result,
       profile_subject_result
FROM student_array
;

UPDATE student_json
SET parents = (
    SELECT jsonb_agg(jsonb_build_object(
        'parent', student_and_parent.parent,
        'who_is', student_and_parent.who_is
    ))
    FROM student_and_parent
    WHERE student_json.id = student_and_parent.student
)
WHERE EXISTS (
    SELECT 1
    FROM student_and_parent
    WHERE student_json.id = student_and_parent.student
);

UPDATE student_json
SET phones = (
    SELECT jsonb_agg(json_build_object(
            'phone', student_telephone.phone_number
                     ))
    FROM student_telephone
    WHERE student_json.id = student_telephone.student
    )
WHERE EXISTS (
    SELECT 1
    FROM student_telephone
    WHERE student_json.id = student_telephone.student
);

UPDATE student_json
SET emails = (
    SELECT jsonb_agg(json_build_object(
            'email', student_email.email
                     ))
    FROM student_email
    WHERE student_json.id = student_email.student
    )
WHERE EXISTS (
    SELECT 1
    FROM student_email
    WHERE student_json.id = student_email.student
);
