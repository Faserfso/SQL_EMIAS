SELECT
    raur.id,
    raur.login_id,
    raur.user_role_id,
    raur.lpu_id,
    lpu.name AS lpu_name,
    ur.user_role,
    a.login,
    me.last_name,
    me.first_name,
    me.second_name,
    a.login_id AS login_id1,
    ds.name,
    me.snils
FROM
    emias_cluster.lpu lpu ,
    emias_cluster.rel_account_and_user_role raur,
    emias_cluster.user_role ur,
    emias_cluster.account a,
    emias_cluster.account_lpu_blocking_status albs,
    lpu_department lpuid,
    medical_employee_job_info meji,
    medical_employee me,
    --JOIN medical_employee_job_info meji ON me.id = meji.medical_employee_id
    doc_speciality ds

where
a.status='ACTIVE'
AND nvl(albs.status,a.status)='ACTIVE'

AND lpu.id = raur.lpu_id
AND ur.id = raur.user_role_id
AND a.login_id = raur.login_id
AND albs.lpu_id = raur.lpu_id
AND lpu.id=lpuid.id
AND meji.department_lpu_id=lpuid.id
AND a.medical_employee_id= me.id
AND meji.medical_employee_id= me.id
AND ds.code = meji.speciality_id
--and raur.user_role_id=1
 
 /*   emias_cluster.lpu lpu 
    join emias_cluster.rel_account_and_user_role raur ON lpu.id = raur.lpu_id
    JOIN emias_cluster.user_role ur ON ur.id = raur.user_role_id
    JOIN emias_cluster.account a ON a.login_id = raur.login_id
    JOIN emias_cluster.account_lpu_blocking_status albs ON albs.account_id = raur.login_id AND albs.lpu_id = raur.lpu_id

    join lpu_department lpuid on lpu.id=lpuid.id 
    join medical_employee_job_info meji ON meji.department_lpu_id=lpuid.id
    
    join     medical_employee me ON me.id = a.medical_employee_id and meji.medical_employee_id= me.id
    --JOIN medical_employee_job_info meji ON me.id = meji.medical_employee_id
    JOIN doc_speciality ds ON ds.code = meji.speciality_id
*/
