select nm_l ЛПУ ,lid  ,
nm_d Номер_участка, 
tp_d Тип_участка,aa  автоназначение,
replace(replace(wmsys.wm_concat(adr_1), ',', chr(10)), ';', ',') Адреса
  from 
(select 
lid  ,
nm_l ,
nm_d , 
tp_d ,aa,
(case 
when okr is null then null
 else  to_nclob(okr || '; '||
 reg_e || '; '||
 str_e ||' ' || LISTAGG(adr_e, '; ') WITHIN GROUP (order by adr_e))
end) adr_1
 from
(select lid, nm_l,nm_d, tp_d, okr,aa,
(case when reg is not null then reg else 'Все районы' end ) reg_e,
(case when str is not null then str else 'Все улицы' end ) str_e,
(case when adr<> '   ' then adr else 'Все дома' end ) adr_e

from 
 (select l.id lid, l.name nm_l,
sd.district_number nm_d,
sd.IS_AUTO_ASSIGN_FOR_ATTACH aa,
art.name tp_d, 
ot_d.shortname okr,
ot_r.name reg,
ou.name str,
(case when da.house is not null then ' д.'||da.house else ' '  end ) ||
(case when da.building is not null then ' корп.'||da.building else ' '  end ) ||
(case when da.construction is not null then ' стр.'||da.construction else ' '  end )  adr
from service_district sd
join lpu l on l.id=sd.lpu_id
join lpu_district_type ldt on ldt.id=sd.lpu_district_type
join area_type art on art.code=ldt.district_type
left join district_adress da on da.lpu_district_id=sd.id
left join omk_te ot_d on ot_d.code=da.omk_te_district_code
left join omk_te ot_r on ot_r.code=da.omk_te_region_code
left join omk_um ou on ou.code=da.omk_um_code 
where sd.district_status=1 and ldt.district_type=70 --in (30,190) 
) )
group by nm_l,nm_d, tp_d, okr,reg_e,str_e,lid,aa
order by nm_l,nm_d, tp_d, okr,reg_e,str_e
)

group by nm_l ,nm_d , tp_d, lid,aa
order by nm_l ,nm_d;
