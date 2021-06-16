SELECT
    me.last_name,
    me.first_name,
    me.second_name,
    me.id AS id1,
    me.snils,
    me.birth_date,
    meji.job_start_date,
    meji.job_end_date,
    meji.speciality_id,
    meji.medical_employee_id,
    meji.department_lpu_id,
    ds.name,
    ds.head,
    a.login_id,
    a.login,
    a.status,
    a.new_ui,
    me.phone,
    me.email,
    meji.dismissed,
    meji.rate,
    meji.clock_number
FROM
    medical_employee me
    FULL OUTER JOIN medical_employee_job_info meji ON me.id = meji.medical_employee_id
    FULL OUTER JOIN doc_speciality ds ON ds.code = meji.speciality_id
    FULL OUTER JOIN account a ON me.id = a.medical_employee_id