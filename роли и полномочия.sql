Select 
M.ID, 
/*M.LAST_NAME, 
M.FIRST_NAME,
M.SECOND_NAME,
to_char (M.BIRTH_DATE , 'DD-MM-YYYY' ) as BIRTH_DATE,
M.SNILS,
case M.Status when 2 then 'Включен в регистр'
else 'Не включен в регистр' end as Status,*/
A.Login,
--A.STATUS as Статус_Аккаунта,
/*MJ.MEDICAL_EMPLOYEE_JOB_INFO_ID as ИД_Исп,
SPECIALITY_ID, 
DOC_SPECIALITY.NAME as NAME_SPECIALITY, */
LPU.id as ИД_МУ_Исп,
LPU.Name as МУ_Исп,
LG.MAIN_LPU_ID as ИД_ГМО,
(Select name from LPU where ID = LG.MAIN_LPU_ID) as ГМО,
/*AGENCYORG.NAME as Подчинен,
l1.id as ИД_МУ_Роли,
l1.Name as МУ_Роли,
'Регистратор' as Роль,
'20002' as Код_Права,
'Ведение регистра ЛЛО' as Право,*/
Case  when A_L.STATUS is null then 'ACTIVE' else A_L.STATUS end as Статус_в_МУ,
to_char (MJ.JOB_START_DATE, 'DD-MM-YYYY') as JOB_START_DATE,
to_char (MJ.JOB_END_DATE,'DD-MM-YYYY') as JOB_END_DATE,
to_char (MJ.Delete_Date,'DD-MM-YYYY') as  DELETE_DATE_JOB
from
Account A
inner join medical_employee M on A.MEDICAL_EMPLOYEE_ID = M.ID
inner join REL_ACCOUNT_AND_USER_ROLE Rol on A.LOGIN_ID = Rol.LOGIN_ID 
inner join LPU l1 on l1.ID = Rol.LPU_ID
inner join MEDICAL_EMPLOYEE_JOB_INFO MJ on M.ID = MJ.MEDICAL_EMPLOYEE_ID
inner join DOC_SPECIALITY on MJ.SPECIALITY_ID = DOC_SPECIALITY.Code
inner join LPU_Department on MJ.DEPARTMENT_LPU_ID = LPU_Department.id
inner join LPU on LPU_Department.LPU_ID = LPU.ID
left join ACCOUNT_LPU_BLOCKING_STATUS A_L on A.LOGIN_ID = A_L.ACCOUNT_ID and A_L.LPU_ID = l1.ID
left join LPU_Group LG on LG.ID = LPU.LPU_GROUP_ID
left join AGENCYORG on AGENCYORG.CODE = LPU.AGENCYORG_CODE
where 
A.STATUS='ACTIVE' and
Rol.user_role_id = '4'
--and Rol.id not in
--(select rel_account_and_user_role_id from rel_disabled_system_role where system_role_id = 20000)
order by M.ID