select 
l2_id ID_головного,
l2_name Наименование,
DR ДР,
VR Вид_ДР,
ds_name специал_ДР,
ds2_name специал_МР,
cab Кабинетов,
rasp Расписание--,
--zap Записей_за_60
from 
(select /*+parallel(8)*/
l2.id l2_id,
l2.name l2_name,
ar.resource_title DR,
ss.name VR,
ds.name ds_name,
ds2.name ds2_name,

(select count(distinct r.room_code) 
from avail_res_complex_res ar_cr
join complex_resource cr on cr.complex_resource_id=ar_cr.complex_resource_id
join room r on r.room_id=cr.room_id
where ar_cr.available_resource_id=ar.available_resource_id 
) cab,

(case when ars.schedule_id is null 
      then 'Нет расписания'
      else 'Есть расписание' 
end
) rasp--,

/*(select count(tp.id) 
from time_period tp
where tp.available_resource_id=ar.available_resource_id and
trunc(tp.start_time) between sysdate-5 and sysdate
) zap*/

from 
available_resource ar 
join lpu_department ld on ld.id=ar.lpu_department_id
join lpu l on l.id=ld.lpu_id
left join lpu_group lg on lg.id=l.lpu_group_id
left join lpu l2 on l2.id=lg.main_lpu_id
left join doc_speciality ds on ds.code=ar.avail_resource_speciality_id
join medical_employee_job_info meji on meji.medical_employee_job_info_id=ar.medical_employee_job_info_id
join doc_speciality ds2 on ds2.code=meji.speciality_id
left join avail_resource_schedule ars on ars.avaialble_resource_id=ar.available_resource_id
join schedule_section  ss on ss.code=ar.schedule_section_id
left join lpu_schedule ls on  
     ls.lpu_schedule_id=ars.lpu_schedule_id and
     ls.start_date<=to_date(sysdate, 'dd.mm.yy') and 
     ls.end_date>=to_date(sysdate, 'dd.mm.yy') and 
     ls.is_active=1  
where ar.is_archived<>1 and upper(l.name) not like '%СПЕЦИАЛЬ%' 
)
where cab>1
order by l2_id;