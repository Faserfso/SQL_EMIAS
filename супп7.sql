SELECT
    a.login,
    me.last_name
    || ' '
    || me.first_name
    || ' '
    || me.second_name фио,
    ds.name название_ид,
    t.medical_employee_id,
    t.medical_employee_job_info_id,

    t.job_start_date,
    t.job_end_date,
    t.delete_date,
    d.id lpu_department,
    d.name,
    l.id,
    l.name,
    a.medical_employee_id
FROM
    medical_employee@emiasdb me,
    medical_employee_job_info@emiasdb t,
    lpu_department@emiasdb d,
    lpu@emiasdb l,
    emias_cluster.account a,
    emias_cluster.doc_speciality ds
WHERE
    t.department_lpu_id = d.id
    AND   d.lpu_id = l.id
    AND   me.id = t.medical_employee_id
    AND   a.medical_employee_id = t.medical_employee_id
    AND   t.speciality_id = ds.code
   -- AND   a.login = 'NVagina'
   AND me.snils = 13637490272