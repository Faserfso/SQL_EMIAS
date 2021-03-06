SELECT distinct
 me.id,
 me.LAST_UPDATE_DATE,
  raur.id,
 --   raur.login_id,
--    raur.user_role_id,
    raur.lpu_id,
    lpu.name AS lpu_name,
--    ur.user_role,
    a.login,
    a.login_id,
    me.last_name ||' '|| me.first_name ||' '|| me.second_name ???,
    me.email,
 --  a.status AS account_status,
 --   nvl(albs.status,a.status) AS account_lpu_status,
--   lpu.email,
    me.snils,
    lpu.lpu_group_id ??_??????,
    lg.MAIN_LPU_ID ??_??????,
    l2.name ??????,
    --(Select count (ar.attachment_request_id) from Attachment_request ar where Attachment_request_status=10 and ar.service_district_id=sd.id) ?????????,
    
--    (Select count (raur1.user_role_id) from rel_account_and_user_role raur1 where Attachment_request_status=10 and ar.service_district_id=sd.id) ?????
        
    
    '????' ????

FROM
    emias_cluster.rel_account_and_user_role raur
    LEFT OUTER JOIN emias_cluster.lpu lpu ON lpu.id = raur.lpu_id
        left join emias_cluster.lpu_group lg on lpu.lpu_group_id=lg.id
    left join emias_cluster.lpu l2 on l2.id=lg.main_lpu_id
    INNER JOIN emias_cluster.user_role ur ON ur.id = raur.user_role_id
    INNER JOIN emias_cluster.account a ON a.login_id = raur.login_id
    INNER JOIN emias_cluster.medical_employee me ON me.id = a.medical_employee_id
    LEFT OUTER JOIN emias_cluster.account_lpu_blocking_status albs ON albs.account_id = raur.login_id
                                                                      AND albs.lpu_id = raur.lpu_id
where 
--USER_ROLE_ID=1 and
a.login in ('SFedosov','EkatLeonteva',
'LaGurina',
'OlgaGuseva14',
'OIliev-Maiorov',
'ElenaGuseva20',
'ASereda',
'AleKupriyanov',
'TKaraulnova',
'DGitinov') and
--(raur.user_role_id = 4 ) and
a.status='ACTIVE'
AND nvl(albs.status,a.status)='ACTIVE'
--and (raur.id<=0 or a.login_id <0)

/*ORDER BY
    a.login,
    raur.lpu_id*/
UNION
SELECT distinct
me.id,
 me.LAST_UPDATE_DATE,
  raur.id,
 --   raur.login_id,
 --  raur.user_role_id,
    raur.lpu_id,
    lpu.name AS lpu_name,
    --ur.user_role,
    a.login,
    a.login_id,
    me.last_name ||' '|| me.first_name ||' '|| me.second_name ???,
    me.email,
   -- a.status AS account_status,
   -- nvl(albs.status,a.status) AS account_lpu_status,
--   lpu.email,
    me.snils,
    lpu.lpu_group_id ??_??????,
    lg.MAIN_LPU_ID ??_??????,
    l2.name ??????,
 '???2' ????

FROM
    etd2.rel_account_and_user_role raur
    LEFT OUTER JOIN emias_cluster.lpu lpu ON lpu.id = raur.lpu_id
        left join emias_cluster.lpu_group lg on lpu.lpu_group_id=lg.id
    left join emias_cluster.lpu l2 on l2.id=lg.main_lpu_id
    INNER JOIN etd2.user_role ur ON ur.id = raur.user_role_id
    INNER JOIN emias_cluster.account a ON a.login_id = raur.login_id
    INNER JOIN emias_cluster.medical_employee me ON me.id = a.medical_employee_id
    LEFT OUTER JOIN emias_cluster.account_lpu_blocking_status albs ON albs.account_id = raur.login_id
                                                                      AND albs.lpu_id = raur.lpu_id
where 
--USER_ROLE_ID=1 and
a.login in ('EkatLeonteva',
'LaGurina',
'OlgaGuseva14',
'OIliev-Maiorov',
'ElenaGuseva20',
'ASereda',
'AleKupriyanov',
'TKaraulnova',
'DGitinov') and
--(raur.user_role_id = 4 ) and
a.status='ACTIVE'
AND nvl(albs.status,a.status)='ACTIVE'
--and (raur.id<=0 or a.login_id <0)

/*ORDER BY
    a.login,
    raur.lpu_id*/