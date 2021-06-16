select l.name ЛПУ, l.id ИД_ЛПУ, sd.district_number Участок, art.name Тип,
sd.district_status Статус_участка,sd.id ИД_участка, ldt.district_type
from lpu l 
join service_district sd on sd.lpu_id =l.id
join lpu_district_type ldt on ldt.id=sd.lpu_district_type
join area_type art on art.code=ldt.district_type
where ldt.district_type=70 --and l.id=10279028
--art.code in (30,190) and sd.lpu_id=218-- типы участков Взрослый стоматологический и детский стоматологический
--order by 2,3;



/*



Ошибка при обработке SQL: DATA_READ ERROR: The JDBC storage plugin failed while trying setup the SQL query. sql 
SELECT t3.USER_ROLE role, 
       t3.NAME lpu_name, 
       t3.NAME0 head_name, 
       COUNT(t21.USER_ROLE_ID) count_role 
        FROM (SELECT t0.ID0, 
                     t0.NAME, 
                     t0.NAME0, 
                     t0.USER_ROLE 
                FROM (SELECT 
                        rel_account_and_user_role.LOGIN_ID, 
                        rel_account_and_user_role.LPU_ID, 
                        lpu.ID ID0, 
                        lpu.NAME, 
                        lpu0.NAME NAME0, 
                        user_role.USER_ROLE, 
                        CAST(t.STATUS AS VARCHAR(10)) STATUS0 
                    FROM emias_cluster.rel_account_and_user_role 
                         LEFT JOIN emias_cluster.lpu ON rel_account_and_user_role.LPU_ID = lpu.ID 
                         LEFT JOIN lpu_group ON lpu.LPU_GROUP_ID = lpu_group.ID 
                         LEFT JOIN lpu lpu0 ON lpu_group.MAIN_LPU_ID = lpu0.ID 
                         LEFT JOIN emias_cluster.user_role ON rel_account_and_user_role.USER_ROLE_ID = user_role.ID 
                         INNER JOIN (SELECT * FROM emias_cluster.account WHERE STATUS = 'ACTIVE') t ON rel_account_and_user_role.LOGIN_ID = t.LOGIN_ID) t0 
                         LEFT JOIN (SELECT ACCOUNT_ID, LPU_ID, STATUS FROM emias_cluster.account_lpu_blocking_status) t1 ON t0.LOGIN_ID = t1.ACCOUNT_ID AND t0.LPU_ID = t1.LPU_ID WHERE NVL(t1.STATUS, t0.STATUS0) = 'ACTIVE') t3 
                         LEFT JOIN (SELECT t21.ID01, t21.USER_ROLE00, COUNT(t21.USER_ROLE_ID) FROM (SELECT t18.LOGIN_ID, t18.USER_ROLE_ID, t18.LPU_ID, CAST(t20.STATUS AS VARCHAR(10)) STATUS0, t18.ID01, t18.USER_ROLE00 FROM (SELECT t10.LOGIN_ID, t10.USER_ROLE_ID, t10.LPU_ID, t17.ID0 ID01, t17.USER_ROLE0 USER_ROLE00 FROM (SELECT rel_account_and_user_role0.LOGIN_ID, rel_account_and_user_role0.USER_ROLE_ID, rel_account_and_user_role0.LPU_ID FROM emias_cluster.rel_account_and_user_role rel_account_and_user_role0 INNER JOIN (emias_cluster.lpu lpu1 INNER JOIN (SELECT t5.ID0, t5.USER_ROLE FROM (SELECT rel_account_and_user_role1.LOGIN_ID, rel_account_and_user_role1.LPU_ID, lpu2.ID ID0, user_role0.USER_ROLE, CAST(t4.STATUS AS VARCHAR(10)) STATUS0 FROM emias_cluster.rel_account_and_user_role rel_account_and_user_role1 LEFT JOIN emias_cluster.lpu lpu2 ON rel_account_and_user_role1.LPU_ID = lpu2.ID LEFT JOIN lpu_group lpu_group0 ON lpu2.LPU_GROUP_ID = lpu_group0.ID LEFT JOIN lpu lpu3 ON lpu_group0.MAIN_LPU_ID = lpu3.ID LEFT JOIN emias_cluster.user_role user_role0 ON rel_account_and_user_role1.USER_ROLE_ID = user_role0.ID INNER JOIN (SELECT * FROM emias_cluster.account WHERE STATUS = 'ACTIVE') t4 ON rel_account_and_user_role1.LOGIN_ID = t4.LOGIN_ID) t5 LEFT JOIN (SELECT ACCOUNT_ID, LPU_ID, STATUS FROM emias_cluster.account_lpu_blocking_status) t6 ON t5.LOGIN_ID = t6.ACCOUNT_ID AND t5.LPU_ID = t6.LPU_ID WHERE NVL(t6.STATUS, t5.STATUS0) = 'ACTIVE' GROUP BY t5.ID0, t5.USER_ROLE) t9 ON lpu1.ID = t9.ID0) ON rel_account_and_user_role0.LPU_ID = lpu1.ID) t10 INNER JOIN (SELECT user_role1.ID, t16.ID0, t16.USER_ROLE USER_ROLE0 FROM emias_cluster.user_role user_role1 INNER JOIN (SELECT t12.ID0, t12.USER_ROLE FROM (SELECT rel_account_and_user_role2.LOGIN_ID, rel_account_and_user_role2.LPU_ID, lpu4.ID ID0, user_role2.USER_ROLE, CAST(t11.STATUS AS VARCHAR(10)) STATUS0 FROM emias_cluster.rel_account_and_user_role rel_account_and_user_role2 LEFT JOIN emias_cluster.lpu lpu4 ON rel_account_and_user_role2.LPU_ID = lpu4.ID LEFT JOIN lpu_group lpu_group1 ON lpu4.LPU_GROUP_ID = lpu_group1.ID LEFT JOIN lpu lpu5 ON lpu_group1.MAIN_LPU_ID = lpu5.ID LEFT JOIN emias_cluster.user_role user_role2 ON rel_account_and_user_role2.USER_ROLE_ID = user_role2.ID INNER JOIN (SELECT * FROM emias_cluster.account WHERE STATUS = 'ACTIVE') t11 ON rel_account_and_user_role2.LOGIN_ID = t11.LOGIN_ID) t12 LEFT JOIN (SELECT ACCOUNT_ID, LPU_ID, STATUS FROM emias_cluster.account_lpu_blocking_status) t13 ON t12.LOGIN_ID = t13.ACCOUNT_ID AND t12.LPU_ID = t13.LPU_ID WHERE NVL(t13.STATUS, t12.STATUS0) = 'ACTIVE' GROUP BY t12.ID0, t12.USER_ROLE) t16 ON user_role1.USER_ROLE = t16.USER_ROLE) t17 ON t10.USER_ROLE_ID = t17.ID) t18 INNER JOIN (SELECT LOGIN_ID, STATUS FROM emias_cluster.account WHERE STATUS = 'ACTIVE') t20 ON t18.LOGIN_ID = t20.LOGIN_ID) t21 LEFT JOIN (SELECT ACCOUNT_ID, LPU_ID, STATUS FROM emias_cluster.account_lpu_blocking_status) t22 ON t21.LOGIN_ID = t22.ACCOUNT_ID AND t21.LPU_ID = t22.LPU_ID WHERE NVL(t22.STATUS, t21.STATUS0) = 'ACTIVE' GROUP BY t21.ID01, t21.USER_ROLE00) t25 ON t3.ID0 = t25.ID01 AND t3.USER_ROLE = t25.USER_ROLE00 plugin std_default_jdbc666 Fragment 0:0 [Error Id: fc7d4f0c-290d-4180-bbe0-d8127de292e1 on idvp-data-drill:31010]
