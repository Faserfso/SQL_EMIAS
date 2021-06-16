select
acc.login login, 
acc.login_id login_id
--l.name lpu, 
--l.id LPU_ID, 
--ur.USER_role role,
--'supp' basa
from emias_cluster.account acc
--join emias_cluster.rel_account_and_user_role raaur on raaur.login_id=acc.login_id
--    INNER JOIN emias_cluster.user_role ur ON ur.id = raAur.user_role_id
--full join emias_cluster.lpu l on l.id=raaur.lpu_id
where --raaur.user_role_id='2' 
acc.login ='USer1' and 
exists (select * from emias_cluster.notification_event ne where ne.notification_event_type_id=10 and ne.account_id=acc.login_id)-- and ne.lpu_id=l.id)


/*select 
acc.login login, 
acc.login_id login_id, 
l.name lpu, 
l.id LPU_ID, 
ur.USER_role role,
'supp' basa
from emias_cluster.account acc
join emias_cluster.rel_account_and_user_role raaur on raaur.login_id=acc.login_id
    INNER JOIN emias_cluster.user_role ur ON ur.id = raAur.user_role_id
full join emias_cluster.lpu l on l.id=raaur.lpu_id
where --raaur.user_role_id='2' and 
exists (select 1 from emias_cluster.notification_event ne where ne.notification_event_type_id=10 and ne.account_id=acc.login_id)-- and ne.lpu_id=l.id)

union

select 
acc.login login, 
acc.login_id login_id, 
l.name lpu, 
l.id LPU_ID, 
ur.USER_role role,
'etd2' basa

from emias_cluster.account acc
join etd2.rel_account_and_user_role raaur on raaur.login_id=acc.login_id
    INNER JOIN etd2.user_role ur ON ur.id = raAur.user_role_id
full join emias_cluster.lpu l on l.id=raaur.lpu_id
where --raaur.user_role_id='2' and 
exists (select 1 from emias_cluster.notification_event ne where ne.notification_event_type_id=10 and ne.account_id=acc.login_id)-- and ne.lpu_id=l.id)



*/

--and acc.status='ACTIVE' and not exists (select 1 from account_lpu_blocking_status albs where albs.status='BLOCKED' and acc.login_id=albs.account_id and  raaur.lpu_id=albs.lpu_id)