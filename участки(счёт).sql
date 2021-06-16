select l.name ЛПУ, l.id ИД_ЛПУ, sd.district_number Участок, art.name Тип,
(Select count (ar.attachment_request_id) from Attachment_request ar where Attachment_request_status=10 and ar.service_district_id=sd.id) Заявлений,
(Select count (ar.attachment_request_id) from Attachment_request ar where Attachment_request_status=40 and ar.service_district_id=sd.id) Прикреплений,
(select count(da.id) from district_adress da where  da. LPU_DISTRICT_ID=SD.ID  ) Адресов,
(select count(de.DISTRICT_EMPLOYEE_ID) from DISTRICT_EMPLOYEE de where de.service_district_id= SD.ID ) Участковых,
sd.district_status Статус_участка,
sd.id ИД_участка
from lpu l 
join service_district sd on sd.lpu_id =l.id
join lpu_district_type ldt on ldt.id=sd.lpu_district_type
join area_type art on art.code=ldt.district_type
where ldt.district_type=70-- and l.id=10137578
--art.code in (30,190) and sd.lpu_id=218-- типы участков Взрослый стоматологический и детский стоматологический
order by 2,3;