select l.name ЛПУ,
l.id ИД_ЛПУ,
sd.district_number Участок,
sd.id ИД_участка,
art.name Тип

/*ot2.name округ,
ot.name район,
sd.district_status Статус_участка,

um.name улица,
da.house дом,
da.building корпус,
da.construction строение*/
from lpu l 
join service_district sd on sd.lpu_id =l.id
join lpu_district_type ldt on ldt.id=sd.lpu_district_type
join area_type art on art.code=ldt.district_type
--join district_adress da on da.LPU_DISTRICT_ID=SD.ID
/*left join omk_te ot on ot.code=da.omk_te_region_code
left join omk_um um on um.CODE=da.omk_um_CODE
left join omk_te ot2 on ot2.code=da.omk_te_district_code*/
where --sd.district_status=1 --and art.code in (30,190) -- типы участков Взрослый стоматологический и детский стоматологический
--and 
l.id  = 10718753


order by 2,3;
