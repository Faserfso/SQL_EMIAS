select acc.login, acc.login_id, l.name , l.id LPU_ID
from account acc
join rel_account_and_user_role raaur on raaur.login_id=acc.login_id
join lpu l on l.id=raaur.lpu_id
where raaur.user_role_id='1' and exists (select 1 from notification_event ne where ne.notification_event_type_id=10 and ne.account_id=acc.login_id and ne.lpu_id=l.id)
and acc.status='ACTIVE' and not exists (select 1 from account_lpu_blocking_status albs where albs.status='BLOCKED' and acc.login_id=albs.account_id and  raaur.lpu_id=albs.lpu_id)