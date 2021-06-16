SELECT
    me.snils,
    a.login,
    lpu.name,
    lpu.lpu_number,
    a.new_ui,
    a.status AS status1,
    a.registration_date,
    a.other_user_id,
    me.first_name,
    me.last_name,
    me.second_name,
    me.birth_date,
    ur2.user_role AS user_role3,
    ur2.status AS status5,
    ur2.modification_date AS modification_date3,
    a.login_id,
    a.modification_date AS modification_date1,
    albse.status AS status3,
    albs.status AS status4,
    albs.me_block_reason_id,
    albs.block_date,
    albse.me_block_reason_id AS me_block_reason_id1,
    albse.block_date AS block_date1,
    lpue.name AS name1,
    lpue.lpu_number AS lpu_number1
FROM
    etd2.account a
    RIGHT JOIN etd2.rel_account_and_user_role raaur2 ON a.login_id = raaur2.login_id
    INNER JOIN etd2.user_role ur2 ON raaur2.user_role_id = ur2.id
    LEFT JOIN emias_cluster.medical_employee me ON a.medical_employee_id = me.id
    INNER JOIN etd2.account_lpu_blocking_status albs ON raaur2.id = albs.account_id
    INNER JOIN etd2.lpu lpu ON albs.lpu_id = lpu.id,etd2.account_lpu_blocking_status albse
    INNER JOIN etd2.lpu lpue ON albse.lpu_id = lpue.id