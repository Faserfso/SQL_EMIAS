
Select AC.LOGIN,COUNT(*) as Kol_vo from REL_ACCOUNT_AND_USER_ROLE REL_
join USER_ROLE U_R on U_R.ID = REL_.USER_ROLE_ID
join ACCOUNT AC on AC.LOGIN_ID = REL_.LOGIN_ID
    LEFT OUTER JOIN emias_cluster.account_lpu_blocking_status albs ON albs.account_id = REL_.login_id
                                                                      AND albs.lpu_id = REL_.lpu_id
where
ac.status='ACTIVE'
AND nvl(albs.status,ac.status)='ACTIVE'
and ac.login = 'AAidinova'
group by AC.LOGIN
