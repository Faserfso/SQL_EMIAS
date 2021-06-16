SELECT *
--raur.id,
--    raur.login_id,
--    raur.user_role_id,
--    raur.lpu_id,
--    lpu.name AS lpu_name,
--    ur.user_role,
--    a.login,
--    me.last_name,
--    me.first_name,
--    me.second_name,
--    a.status AS account_status,
--    nvl(albs.status,a.status) AS account_lpu_status,
--    a.login_id AS login_id1,
--    me.id AS id1,
--    me.snils
FROM
   EMIAS_CLUSTER.ACCOUNT a
   join emias_cluster.rel_account_and_user_role sraur on a.LOGIN_ID=sraur.LOGIN_ID
   join etd2.rel_account_and_user_role eraur on a.LOGIN_ID=eraur.LOGIN_ID
--    LEFT OUTER JOIN emias_cluster.lpu lpu ON lpu.id = raur.lpu_id
--    INNER JOIN emias_cluster.user_role ur ON ur.id = raur.user_role_id
--    INNER JOIN account a ON a.login_id = raur.login_id
--    INNER JOIN medical_employee me ON me.id = a.medical_employee_id
-- --    INNER JOIN medical_employee_job_info meji ON me.id = meji.medical_employee_id
--   -- INNER JOIN doc_speciality ds ON ds.code = meji.speciality_id
    --LEFT OUTER JOIN account_lpu_blocking_status albs ON albs.account_id = raur.login_id
     --                                                   AND albs.lpu_id = raur.lpu_id
     where a.LOGIN='OkDenisenko'
--ORDER BY
 --   a.login,
  --  raur.lpu_id