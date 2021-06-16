select me.last_name ||' ' ||me.first_name ||' ' || me.second_name ФИО,
acc.login Логин,
meji.medical_employee_job_info_id Исполнение,
l.name ЛПУ,
sd.district_number Номер_участка,
sd.name Наимен_участка,
(case
when de.is_replacement=1 then 'Заместитель'
else 'Участковый'
end) Признак
from medical_employee me 
join account acc on acc.medical_employee_id=me.id
join medical_employee_job_info meji on meji.medical_employee_id=me.id
join district_employee de on de.medical_employee_job_info_id=meji.medical_employee_job_info_id
join service_district sd on sd.id=de.service_district_id
join lpu l on l.id=sd.lpu_id
order by acc.login, l.name, sd.district_number
;