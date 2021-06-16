SELECT
    --DISTINCT
  --  a.login,
    me.last_name
    || ' '
    || me.first_name
    || ' '
    || me.second_name фио,
    me.snils,
 --   ds.name название_ид,
 --   l.id,
 --   l.name,
    meji.medical_employee_job_info_id,
    meji.job_start_date,
    meji.job_end_date,
    meji.delete_date,
    meji.medical_employee_id,
   -- a.NEW_UI,
    ar.RESOURCE_TITLE,
    ar.AVAILABLE_RESOURCE_ID
FROM
EMIAS_CLUSTER.AVAILABLE_RESOURCE ar
left join emias_cluster.medical_employee_job_info meji ON ar.MEDICAL_EMPLOYEE_JOB_INFO_ID = meji.medical_employee_job_info_id
left join emias_cluster.medical_employee me on meji.medical_employee_id = me.id
--left join emias_cluster.account a on a.medical_employee_id = meji.medical_employee_id

/*  emias_cluster.medical_employee me
  left join emias_cluster.medical_employee_job_info meji on meji.medical_employee_id = me.id
  left join emias_cluster.account a on a.medical_employee_id = meji.medical_employee_id
--  left join emias_cluster.doc_speciality ds on ds.code = meji.speciality_id
 --   left join emias_cluster.lpu_department ts on  ts.id = meji.department_lpu_id
 --   left join emias_cluster.lpu l on l.id = ts.lpu_id
    --LEFT JOIN EMIAS_CLUSTER.REL_ACCOUNT_AND_USER_ROLE raur ON RAUR.LOGIN_ID = a.LOGIN_ID
    full JOIN EMIAS_CLUSTER.AVAILABLE_RESOURCE ar ON ar.MEDICAL_EMPLOYEE_JOB_INFO_ID = meji.medical_employee_job_info_id*/
WHERE   
 --(meji.job_end_date is null or to_char(meji.job_end_date, 'dd.mm.yyyy')>=sysdate) -- убрать если нужно просроченное исполнение
--AND
--(meji.DELETE_DATE is null or to_char(meji.DELETE_DATE, 'dd.mm.yyyy')>=sysdate)
--AND RAUR.USER_ROLE_ID = 4
 --AND a.STATUS = 'ACTIVE'
--AND 
--a.login = 'FBorzenkov';
meji.medical_employee_job_info_id in (200001188475, 200001212520)
--meji.medical_employee_id=200001188470