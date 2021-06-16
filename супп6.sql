select distinct l.id ��_���, l.name ������������, lt.name ���,l.lpu_group_id id_������,l.name ��,l.head_finance, l.is_introduced,
(case  
when br.building is not null and  br.construction is not null then ou.name || ' �.'|| br.house || ' �.'|| br.building || ' ���.'|| br.construction 
when br.building is not null and  br.construction is  null then ou.name || ' �.'|| br.house || ' �.'|| br.building 
when br.building is  null and  br.construction is not null then ou.name || ' �.'|| br.house || ' ���.'|| br.construction 
when br.building is  null and  br.construction is  null then ou.name || ' �.'|| br.house 
end) ����� 
from  lpu l  -- ��� �� ����. ��-��
join lpu_type lt on lt.code=l.type_id
join building_registry br on br.code=l.building_registry_code
join omk_um ou on ou.bti_code=br.um_bti_code
where exists 
(select 1 from service_district sd 
join lpu_district_type ldt on ldt.id=sd.lpu_district_type
where  sd.lpu_id=l.id and ldt.district_type in (190,30) and sd.district_status=1 and l.id not in(233,
10000462,
10000465,
10000465,
10228803,
10000459
))
 
union --all 
select l.id ��_���, l.name ������������, lt.name ���, l.lpu_group_id id_������, l2.name ��,l.head_finance, l.is_introduced,
(case  
when br.building is not null and  br.construction is not null then ou.name || ' �.'|| br.house || ' �.'|| br.building || ' ���.'|| br.construction 
when br.building is not null and  br.construction is  null then ou.name || ' �.'|| br.house || ' �.'|| br.building 
when br.building is  null and  br.construction is not null then ou.name || ' �.'|| br.house || ' ���.'|| br.construction 
when br.building is  null and  br.construction is  null then ou.name || ' �.'|| br.house 
end) �����  from lpu l
join lpu_type lt on lt.code=l.type_id
join lpu_group lg on lg.id=l.lpu_group_id
join lpu l2 on l2.id=lg.main_lpu_id
join building_registry br on br.code=l.building_registry_code
join omk_um ou on ou.bti_code=br.um_bti_code
where 
lt.code in (41,42)  --���� ������������
and 
l.lpu_group_id in  --  ������ � ������, ��� ���� ����. �������
(select distinct l1.lpu_group_id 
from service_district sd 
join lpu_district_type ldt on ldt.id=sd.lpu_district_type
join lpu l1 on l1.id=sd.lpu_id
where  ldt.district_type in (190,30) and sd.district_status=1 and l1.lpu_group_id is not null)
and l.id not in(233,
10000462,
10000465,
10000465,
10228803,
10000459
)

order by 4,2;