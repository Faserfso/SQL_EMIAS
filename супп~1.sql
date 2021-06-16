SELECT
    raur.id,
    raur.login_id,
    raur.user_role_id,
    raur.lpu_id,
    lpu.name AS lpu_name,
   -- lpu.address,
    ur.user_role,
    a.login,
 --   me.last_name,
 --   me.first_name,
 --   me.second_name,
    a.status AS account_status,
    nvl(albs.status,a.status) AS account_lpu_status,
--    lpu.email,
--    lpu.specialization_code,
--    lpu.nomenclature_code,
--    a.login_id AS login_id1,
--    me.id AS id1,
--    me.birth_date,
--    me.gender,
--    me.inn,
--    me.phone,
--    me.email AS email1,
    me.snils
FROM
    etd2.rel_account_and_user_role raur
    LEFT OUTER JOIN emias_cluster.lpu lpu ON lpu.id = raur.lpu_id
    INNER JOIN etd2.user_role ur ON ur.id = raur.user_role_id
    INNER JOIN emias_cluster.account a ON a.login_id = raur.login_id
    INNER JOIN emias_cluster.medical_employee me ON me.id = a.medical_employee_id
    LEFT OUTER JOIN emias_cluster.account_lpu_blocking_status albs ON albs.account_id = raur.login_id
                                                                      AND albs.lpu_id = raur.lpu_id


where (USER_ROLE_ID=5 or USER_ROLE_ID=7013) -- in (
                        --10095553, 112,192,10000284,10000285,10000454,10000251,10000308 --gp12
                        --10000247106,236,10000290 --dgp110
--)
AND a.status='ACTIVE'
AND nvl(albs.status,a.status)='ACTIVE'

ORDER BY
    a.login,
    raur.lpu_id
