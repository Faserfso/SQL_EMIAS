select distinct acc.login Логин, l.name ЛПУ, l.id lpuid, ur.user_role Роль,ds.name Специальность, me.snils
from account  acc
    INNER JOIN emias_cluster.medical_employee me ON me.id = acc.medical_employee_id
join etd2.rel_account_and_user_role raaur on raaur.login_id=acc.login_id
join emias_cluster.lpu l on l.id=raaur.lpu_id
join etd2.user_role ur on ur.id=raaur.user_role_id
left join emias_cluster.medical_employee_job_info meji on
     meji.medical_employee_id=acc.medical_employee_id and
     meji.department_lpu_id in (select id from lpu_department ld where  l.id=ld.lpu_id ) and
     meji.dismissed<>1 and
     (meji.job_end_date is null or to_char(meji.job_end_date, 'dd.mm.yyyy')>=sysdate)
left join emias_cluster.doc_speciality ds on ds.code=meji.speciality_id
    
where 
--acc.login='Dizmailova'-- and
--me.snils=13637490272-- and

(acc.status='ACTIVE' and not exists (select 1 from account_lpu_blocking_status albs where albs.status='BLOCKED' and acc.login_id=albs.account_id and  raaur.lpu_id=albs.lpu_id))

order by acc.login, l.name, ur.user_role;