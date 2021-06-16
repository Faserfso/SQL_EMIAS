select /*+parallel(8)*/
distinct
qty.code ID_�����,
qty.name �����,
lt.code ID_����_��,
lt.name ���_��,
l2.id ID_��,
l2.name ��,
(select   count ( distinct ars.avaialble_resource_id) 
from   lpu_schedule ls
join avail_resource_schedule ars on ars.lpu_schedule_id = ls.lpu_schedule_id 
join quota qt on qt.SCHEDULE_ID=ars.SCHEDULE_ID 
join lpu l on  l.id=ls.lpu_id
where
 ls.is_active=1 and  l.lpu_group_id=lg.id and qt.quota_type_id=qty.code and to_char(qt.start_time,'mm.yy')='06.18' ) ��_������,
  
(select   sum(extract(hour   from (qt.end_time-qt.start_time))*60  + extract(minute from (qt.end_time-qt.start_time)))
from   lpu_schedule ls
join avail_resource_schedule ars on ars.lpu_schedule_id = ls.lpu_schedule_id 
join quota qt on qt.SCHEDULE_ID=ars.SCHEDULE_ID 
join lpu l on  l.id=ls.lpu_id
where
 ls.is_active=1 and  l.lpu_group_id=lg.id and qt.quota_type_id=qty.code and to_char(qt.start_time,'mm.yy')='06.18' )  ����_������

from  quota_type qty
join lpu_group lg on 1=1
join lpu l2 on l2.id=lg.main_lpu_id
join lpu_type lt on lt.code=l2.type_id
order by  l2.id,qty.code;