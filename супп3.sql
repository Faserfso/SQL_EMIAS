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
    a.status AS account_status,
    nvl(albs.status,a.status) AS account_lpu_status,
    lpu.email,
    lpu.specialization_code,
    lpu.nomenclature_code,
    a.login_id AS login_id1,
    me.id AS id1,
    me.birth_date,
    me.gender,
    me.inn,
    me.phone,
    me.email AS email1,
        ds.name,
    me.snils
FROM
    emias_cluster.rel_account_and_user_role raur
    LEFT OUTER JOIN emias_cluster.lpu lpu ON lpu.id = raur.lpu_id
    INNER JOIN emias_cluster.user_role ur ON ur.id = raur.user_role_id
    INNER JOIN emias_cluster.account a ON a.login_id = raur.login_id
    INNER JOIN emias_cluster.medical_employee me ON me.id = a.medical_employee_id
    LEFT OUTER JOIN emias_cluster.account_lpu_blocking_status albs ON albs.account_id = raur.login_id
                                                                      AND albs.lpu_id = raur.lpu_id
                                                                      
                                                                      join     medical_employee me ON me.id = a.medical_employee_id 
    JOIN medical_employee_job_info meji ON me.id = meji.medical_employee_id
    JOIN doc_speciality ds ON ds.code = meji.speciality_id
where
 a.status='ACTIVE'
AND nvl(albs.status,a.status)='ACTIVE'

    
UNION 
SELECT
    eraur.id,
    eraur.login_id,
    eraur.user_role_id,
    eraur.lpu_id,
    lpu.name AS lpu_name,
    eur.user_role,
    a.login,
    me.last_name,
    me.first_name,
    me.second_name,
    a.status AS account_status,
    nvl(albs.status,a.status) AS account_lpu_status,
    lpu.email,
    lpu.specialization_code,
    lpu.nomenclature_code,
    a.login_id AS login_id1,
    me.id AS id1,
    me.birth_date,
    me.gender,
    me.inn,
    me.phone,
    me.email AS email1,
    ds.name,
    me.snils
FROM
    etd2.rel_account_and_user_role eraur
    LEFT OUTER JOIN emias_cluster.lpu lpu ON lpu.id = eraur.lpu_id
    INNER JOIN etd2.user_role eur ON eur.id = eraur.user_role_id
    INNER JOIN emias_cluster.account a ON a.login_id = eraur.login_id
    INNER JOIN emias_cluster.medical_employee me ON me.id = a.medical_employee_id
    LEFT OUTER JOIN emias_cluster.account_lpu_blocking_status albs ON albs.account_id = eraur.login_id
                                                                      AND albs.lpu_id = eraur.lpu_id
--join medical_employee_job_info@emiasdb t on
--     emias_cluster.doc_speciality ds
     
     
join     medical_employee me ON me.id = a.medical_employee_id 
    JOIN medical_employee_job_info meji ON me.id = meji.medical_employee_id
    JOIN doc_speciality ds ON ds.code = meji.speciality_id
 where a.status='ACTIVE'
AND nvl(albs.status,a.status)='ACTIVE'  
     
     