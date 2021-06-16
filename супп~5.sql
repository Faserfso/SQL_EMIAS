select *  from 
LPU_DISTRICT_TYPE ldt
where 
ldt.district_type in (30,190)
and ldt.IS_ARCHIVED=0