SELECT
    me.snils,
--    raaur.id,
    a.login,
--    raaur.user_role_id,
--    raaur.lpu_id,
--    ur.user_role,
--    ur.status,
--    ur.modification_date,
--    raaur2.id AS id1,
--    raaur2.user_role_id AS user_role_id1,
--    raaur2.lpu_id AS lpu_id1,
--    lpu.name,
--    lpu.lpu_number,
    a.new_ui,
    a.status AS status1,
    a.registration_date,
    a.other_user_id,
    a.auth_type,
    me.first_name,
    me.last_name,
    me.second_name,
    me.birth_date,
--    albs.account_id,
--    albs.lpu_id AS lpu_id2,
--    albs.status AS status2,
--    albs.me_block_reason_id,
--    albs.me_unblock_reason_id,
--    albs.block_reason_desc,
--    albs.block_date,
--    ur.user_role AS user_role1,
--    ur.status AS status3,
--    ur.modification_date AS modification_date1,
--    ur.user_role AS user_role2,
--    ur.status AS status4,
--    ur.modification_date AS modification_date2,
--    ur2.user_role AS user_role3,
--    ur2.status AS status5,
--    ur2.modification_date AS modification_date3,
    a.login_id
FROM
    etd2.rel_account_and_user_role raaur,
    etd2.user_role ur,
    
    emias_cluster.account a,
    --emias_cluster.rel_account_and_user_role raaur2,
    emias_cluster.medical_employee me,
    emias_cluster.lpu lpu
    --emias_cluster.user_role ur2,
    --emias_cluster.account_lpu_blocking_status albs
    where 
    me.id=a.MEDICAL_EMPLOYEE_ID
    --and (a.LOGIN_ID=raaur.LOGIN_ID or a.LOGIN_ID=raaur2.LOGIN_ID)
    --and (ur.ID=raaur.USER_ROLE_ID or ur2.ID=raaur2.USER_ROLE_ID)