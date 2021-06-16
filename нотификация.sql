/*select acc.login, acc.login_id, l.name , l.id LPU_ID, ur.USER_role
from account acc
join emias_cluster.rel_account_and_user_role raaur on raaur.login_id=acc.login_id
    INNER JOIN emias_cluster.user_role ur ON ur.id = raAur.user_role_id
full join lpu l on l.id=raaur.lpu_id
where exists (select 1 from notification_event ne where ne.notification_event_type_id=10 and ne.account_id=acc.login_id)-- and ne.lpu_id=l.id)*/
select lpu_id,account_id,ne.DATE_TIME,ne.OBJECT_LPU_ID,ne.IP_ADDRESS, acc.login 
from emias_cluster.notification_event ne 
left outer join emias_cluster.account acc on ne.account_id=acc.login_id
where ne.notification_event_type_id=10 --and ne.account_id=acc.login_id


--left outer join emias_cluster.rel_account_and_user_role raaur on raaur.login_id=acc.login_id
